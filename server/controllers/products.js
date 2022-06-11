var pool = require('../db/db.js');

getProducts = function(req, res) {
  console.log(`request url:: http://localhost:8080/products`)
  const query = {
    text:`
    SELECT * FROM product WHERE id = $1;
    `,
    values: [1]
  }
  pool.query(query)
  .then((data) => {
    res.status(200).send(data.rows[0])
  })
  .catch((err) => {
    res.status(401).send('could not get products')
  })
}

module.exports = getProducts;
