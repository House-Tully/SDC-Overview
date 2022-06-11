var pool = require('../db/db.js');

getProduct = function(req, res) {
  console.log(res)
  const query = `SELECT * FROM product WHERE id = $1;`//$1 represents the first element in the values array
  pool.query(query, [1])
  .then((data) => {
    console.log(data)
    res.status(200).send(data.rows[0])
  })
  .catch((err) => {
    res.status(401).send('could not get product')
  })
}

module.exports = getProduct;
