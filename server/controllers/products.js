var pool = require('../db/db.js');

getProducts = function(req, res) {
  const count = req.query.count || 5;
  const page = ((req.query.page - 1) * count) || 0;
  console.log(`request url:: http://localhost:8080/products?page=${page}&count=${count}`)
  const query = {
    text:`
    SELECT id, name, slogan, description, category, default_price
    FROM product
    OFFSET $1 ROW FETCH FIRST $2 ROW ONLY;
    `,
    values: [page, count]
  }
  pool.query(query)
  .then((data) => {
    res.status(200).send(data.rows)
  })
  .catch((err) => {
    res.status(401).send('could not get products')
  })
}

module.exports = getProducts;
