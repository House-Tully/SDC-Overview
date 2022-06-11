var pool = require('../db/db.js');

getRelated = function(req, res) {
  console.log(`request url:: http://localhost:8080/products/product_id=${req.params.product_id}/related`)
  const query = {
    text:`
    SELECT *
    FROM related WHERE id = $1;
    `,
    values: [req.params.product_id]
  }
  pool.query(query)
  .then((data) => {
    res.status(200).send(data.rows[0])
  })
  .catch((err) => {
    res.status(401).send('could not get related')
  })
}

module.exports = getRelated;
