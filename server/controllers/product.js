var pool = require('../db/db.js');

getProduct = function(req, res) {
  const query = {
    name: 'fetch-product',
    text: 'SELECT * FROM products WHERE id = $1',
    values: [req],
  }
  pool.query(query)
  .then((data) => {
    res.status(200).send(data.rows[0])
  })
  .catch((err) => {
    res.status(401).send('could not get product')
  })
}

module.exports = getProduct;
