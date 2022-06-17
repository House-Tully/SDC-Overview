require('dotenv').config();
const fs = require('fs');
const {Pool} = require("pg");

const credentials = {
  user: process.env.DATABASE_USER,
  host: process.env.DATABASE_HOST,
  password: process.env.DATABASE_PASSWORD,
  database: "products",
  port: process.env.DATABASE_PORT,
};

// create database connection
const pool = new Pool(credentials)

//connect
pool.connect();

//Simple now() query to confirm connection
pool.query('SELECT now()')
  .then((res) => {
    console.log(`connected to database ${process.env.DATABASE_NAME} as ${process.env.DATABASE_USER} at ${res.rows[0].now}`)
  })
  .catch((err) => {
    console.log("error connecting to DB")
  })

module.exports = pool;