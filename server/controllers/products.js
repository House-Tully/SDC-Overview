var pool = require('../db/db.js');

getProducts = function(req, res) {
  let count = req.query.count || 5;
  let page = req.query.page * count - 1 || 0;
  console.log(`request url:: http://localhost:8080/products?page=${page}&count=${count}`)
  const query = {
    text:`
    SELECT id, name, slogan, description, category, default_price
    FROM product
    LIMIT $2
    OFFSET $1;
    `,
    values: [page, count]
  }
  pool.query(query)
  .then((data) => {
    res.status(200).send(data.rows)
  })
  .catch((err) => {
    console.log(err)
    res.status(401).send('could not get products')
  })
}

module.exports = getProducts;
