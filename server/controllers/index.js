var pool = require('../db/db.js');

module.exports = {

  getQuestions: function(req, res) {
    var queryStr = 'select * from questions where id = 1;'
    pool.query(queryStr)
    .then((data) => {
      res.status(200).send(data.rows)
    })
    .catch((err) => {
      res.status(500).send('could not access data')
    })
  }
}