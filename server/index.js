const { urlencoded } = require("body-parser");
const bodyParser = require("body-parser");
const express = require('express');
require('dotenv').config();
const app = express();
const router = require('./routes/routes.js');

const port = process.env.API_PORT;
const loader_io = process.env.LOADER_IO;

app.listen(port, ()=>{
    console.log(`Sever is now listening at port: ${port}`);
    console.log(`http://localhost:${port}`)
})

app.use(bodyParser.json());

// routes

app.get(`/${loader_io}`, (req, res) => {
  res.send(`${loader_io}`)
})

app.use(`/products`, router) // whats the diff?
