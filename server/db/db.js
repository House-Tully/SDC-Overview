require('dotenv').config();
const fs = require('fs');
const {Pool} = require("pg");
// const schema = fs.readFileSync('/home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/schema.sql').toString();
//import credentials from .env
const credentials = {
  user: process.env.PG_USER,
  host: process.env.PG_HOST,
  password: process.env.PG_PASSWORD,
  database: "products",
  port: process.env.PG_PORT,
};

// create database connection
const pool = new Pool(credentials)

//connect
pool.connect();

// pool.query(schema)

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