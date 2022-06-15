var pool = require('../db/db.js');

getRelated = function(req, res) {
  const query = {
    text:`
    SELECT json_agg(
      related_product_id)
    AS result FROM related WHERE current_product_id = $1;
    `,
    values: [req.params.product_id]
  }
  pool.query(query)
  .then((data) => {
    res.status(200).send(data.rows[0].result)
  })
  .catch((err) => {
    res.status(401).send('could not get related')
  })
}

module.exports = getRelated;
