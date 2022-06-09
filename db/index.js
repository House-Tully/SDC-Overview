require('dotenv').config()
const {Client} = require("pg")

//import credentials from .env
const credentials = {
  user: process.env.DATABASE_USER,
  database: process.env.DATABASE_NAME,
  password: process.env.DATABASE_PASSWORD,
  port: process.env.DATABASE_PORT,
};

// create database connection
const client = new Client(credentials)

//connect
client.connect();

client.query('SELECT now()', (err, res) => {
  if (err) {
    console.log(err)
  } else {
    console.log(res.rows[0])
  }
})
//export connection to routes
module.exports = client;