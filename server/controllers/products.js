var pool = require('../db/db.js');

getProducts = function(req, res) {
  let count = parseInt(req.query.count) || 5;
  let page = parseInt(req.query.page) || 1;
  const query = {
    text:`
    SELECT id, name, slogan, description, category, default_price
    FROM product
    WHERE id > $1
    ORDER BY id
    LIMIT $2;
    `,
    values: [((page * count) - count), count]
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
