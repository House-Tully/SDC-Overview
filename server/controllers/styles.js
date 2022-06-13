var pool = require('../db/db.js');

getStyles = function(req, res) {
  console.log(`request url:: http://localhost:8080/products/:product_id=${req.params.product_id}/styles`)
  const query = {
    text:`
    SELECT json_build_object(
    'product_id', $1::int,
    'results', (SELECT json_agg(
      json_build_object(
        'style_id', id,
        'name', name,
        'original_price', original_price,
        'sale_price', sale_price,
        'default_style', default_style,
        'photos', (SELECT json_agg(
          json_build_object(
            'thumbnail_url', thumbnail_url,
            'url', url
        ))FROM photos WHERE styleId = styles.id),
        'skus', (SELECT json_object_agg(
          skus.id, json_build_object(
            'quantity', quantity,
            'size', size
        ))FROM skus WHERE styleId = styles.id)
      ))FROM styles WHERE productId = $1)
    )data
    `,

    values: [req.params.product_id]
  }
  pool.query(query)
  .then((data) => {
    res.status(200).send(data.rows[0].data)
  })
  .catch((err) => {
    console.log(err)
    res.status(400).send('could not get styles')
  })
}

module.exports = getStyles;
