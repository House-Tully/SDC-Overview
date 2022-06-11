-- ---
-- Table 'product'
--
-- ---
-- psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/schema/product.sql

DROP TABLE IF EXISTS product;

CREATE TABLE product (
  id SERIAL NOT NULL,
  name VARCHAR(250) NOT NULL,
  slogan VARCHAR(500) NOT NULL,
  description VARCHAR(2000) NOT NULL,
  category VARCHAR(100) NOT NULL,
  default_price DECIMAL NOT NULL,
  PRIMARY KEY (id)
);
