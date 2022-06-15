var pool = require('../db/db.js');

getProduct = function(req, res) {
  const query = {
    text:`
    SELECT id, name, slogan, description, category, default_price,
    (SELECT json_agg(
      json_build_object(
        'feature', feature,
        'value', value))
        AS features FROM features
        WHERE product_id=$1)
    FROM product WHERE id = $1;
    `,
    values: [req.params.product_id]
  }
  pool.query(query)
  .then((data) => {
    res.status(200).send(data.rows[0])
  })
  .catch((err) => {
    res.status(400).send('could not get product')
  })
}

module.exports = getProduct;
