const express = require('express');
const router = express.Router();
const controllers = require('../controllers/index.js');

router.get('/product/:product_id', controllers.getProduct);

// router.get('/styles/:product_id', controller.getStyle);

module.exports = router;
