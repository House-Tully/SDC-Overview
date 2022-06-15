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

// Simple query to confirm connection
// should console log the current time (GMT)
pool.query('SELECT now()')
  .then((res) => {
    console.log(`connected to database ${process.env.DATABASE_NAME} as ${process.env.DATABASE_USER}`)
  })
  .catch((err) => {
    console.log("error connecting to DB")
  })

module.exports = pool;