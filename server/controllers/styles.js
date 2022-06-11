var pool = require('../db/db.js');

getStyles = function(req, res) {
  console.log(`request url:: http://localhost:8080/products/product_id=${req.query.product_id}/styles`)
  const query = {
    text:`
    SELECT id
    FROM product WHERE id = $1;
    `,
    values: [req.params.product_id]
  }
  pool.query(query)
  .then((data) => {
    res.status(200).send(data.rows[0])
  })
  .catch((err) => {
    res.status(401).send('could not get styles')
  })
}

module.exports = getStyles;
