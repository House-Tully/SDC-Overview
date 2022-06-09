const pool = require('./db/db.js')
const bodyParser = require("body-parser");
const express = require('express');
require('dotenv').config()

const app = express();

const port = process.env.API_PORT

app.listen(port, ()=>{
    console.log(`Sever is now listening at port: ${port}`);
})

pool.connect();

app.use(bodyParser.json());