require('dotenv').config()
const {Pool} = require("pg")

//import credentials from .env
const credentials = {
  user: process.env.DATABASE_USER,
  database: process.env.DATABASE_NAME,
  password: process.env.DATABASE_PASSWORD,
  port: process.env.DATABASE_PORT,
};

// create database connection
const pool = new Pool(credentials)

//connect
pool.connect();

// Simple query to confirm connection
// should console log the current time (GMT)
pool.query('SELECT now()')
  .then((res) => {
    console.log(`connected to database: ${process.env.DATABASE_NAME} at: ${res.rows[0].now}`)
  })
  .catch((err) => {
    console.log("error connecting to DB")
  })

module.exports = pool;