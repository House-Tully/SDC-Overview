const express = require('express');
const router = express.Router()
const controllers = require('../controllers/index.js');
// const getProduct = require('../controllers/product')

router.get('/products', controllers.getProduct)
// router.get('/products', getProduct)
// router.get('/products', (req, res) => {
//   res.send('getting products')
// })

// router.get('/styles/:product_id', controller.getStyle);

module.exports = router;
