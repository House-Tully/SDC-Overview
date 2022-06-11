-- ---
-- Table 'styles'
--
-- ---
-- psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/schema/styles.sql

DROP TABLE IF EXISTS styles;

CREATE TABLE styles (
  id SERIAL,
  productId INTEGER NOT NULL,
  name VARCHAR(100) NOT NULL,
  sale_price DECIMAL(12,2) DEFAULT 0,
  original_price INTEGER NOT NULL,
  default_style BOOLEAN NOT NULL DEFAULT false,
  PRIMARY KEY (id)
);

ALTER TABLE styles ADD FOREIGN KEY (productId) REFERENCES product (id);
