const express = require('express');
const router = express.Router()
const controllers = require('../controllers/index.js');
// const getProduct = require('../controllers/product.js')

// router.param("product_id", (req, res, next, id) => {
//   console.log("This function will be called first");
//   next();
// });

router.get('', controllers.getProducts)

router.get('/:product_id', controllers.getProduct)

router.get('/:product_id/styles', controllers.getStyles);

router.get('/:product_id/related', controllers.getRelated);

module.exports = router;
