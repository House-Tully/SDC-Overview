// module.exports.getProducts = require('./products.js');
// module.exports.getProduct = require('./product.js');
// module.exports.getStyles = require('./styles.js');
// module.exports.getRelated = require('./related.js');

const getProducts = require('./products.js');
const getProduct = require('./product.js');
const getStyles = require('./styles.js');
const getRelated = require('./related.js');

module.exports = {
  getProducts: getProducts,
  getProduct: getProduct,
  getStyles: getStyles,
  getRelated: getRelated
}