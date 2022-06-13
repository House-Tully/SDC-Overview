const bodyParser = require("body-parser");
const express = require('express');
require('dotenv').config();
const app = express();
const router = require('./routes/routes.js');

const port = process.env.API_PORT;

app.listen(port, ()=>{
    console.log(`Sever is now listening at port: ${port}`);
    console.log(`http://localhost:${port}`)
})

app.use(bodyParser.json());

// routes
// app.get('/products', router)
app.use('/products', router) // whats the diff?
