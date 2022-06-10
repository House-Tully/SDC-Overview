const bodyParser = require("body-parser");
const express = require('express');
require('dotenv').config();
const app = express();
const pool = require('./db/db.js');
const router = require('./routes/routes.js');

const port = process.env.API_PORT;

app.listen(port, ()=>{
    console.log(`Sever is now listening at port: ${port}`);
})

pool.connect();

app.use(bodyParser.json());

// routes
app.use('products', router);
