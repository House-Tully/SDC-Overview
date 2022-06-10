-- ---
-- Start PostgreSQL
-- ---

-- sudo service postgresql stop;

-- sudo service postgresql start;

-- sudo service postgresql restart;

-- sudo -i -u postgres;

-- psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/schema.sql

-- ---
-- Create and use database
-- ---

DROP DATABASE products;

CREATE DATABASE products;

\connect products;

-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'products'
--
-- ---

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

-- ---
-- Table 'styles'
--
-- ---

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

-- ---
-- Table 'features'
--
-- ---

DROP TABLE IF EXISTS features;

CREATE TABLE features (
  id SERIAL NOT NULL,
  product_id INTEGER NOT NULL,
  feature VARCHAR(250) NOT NULL,
  value VARCHAR(250) NOT NULL,
  PRIMARY KEY (id)
);

-- ---
-- Table 'photos'
--
-- ---

-- DROP TABLE IF EXISTS photos;

-- CREATE TABLE photos (
--   id INTEGER,
--   styleId INTEGER NOT NULL REFERENCES styles (id),
--   thumbnail_url VARCHAR NOT NULL,
--   url VARCHAR NOT NULL,
--   PRIMARY KEY (id)
-- );

-- -- ---
-- -- Table 'skus'
-- --
-- -- ---

-- DROP TABLE IF EXISTS skus;

-- CREATE TABLE skus (
--   id INTEGER,
--   styleId INTEGER NOT NULL REFERENCES styles (id),
--   size VARCHAR(50) NOT NULL,
--   quantity INTEGER NOT NULL DEFAULT 0,
--   PRIMARY KEY (id)
-- );

-- -- ---
-- -- Table 'realated'
-- --
-- -- ---

-- DROP TABLE IF EXISTS realated;

-- CREATE TABLE related (
--   id INTEGER,
--   current_product_id INTEGER NOT NULL REFERENCES products (id),
--   related_product_id INTEGER NOT NULL,
--   PRIMARY KEY (id)
-- );

-- -- ---
-- -- Foreign Keys
-- -- ---

ALTER TABLE styles ADD FOREIGN KEY (productId) REFERENCES product (id);
ALTER TABLE features ADD FOREIGN KEY (product_id) REFERENCES product (id);
-- ALTER TABLE photos ADD FOREIGN KEY (styleID) REFERENCES styles (id);
-- ALTER TABLE skus ADD FOREIGN KEY (styleID) REFERENCES styles (id);
-- ALTER TABLE realated ADD FOREIGN KEY (current_product_id) REFERENCES products (id);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `products` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `styles` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `features` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `photos` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `skus` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `realated` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- copy data from .csv files to database
-- ---
-- COPY table_name [ ( column_name [, ...] ) ]
-- FROM { 'filename' | PROGRAM 'command' | STDIN }
-- [ [ WITH ] ( option [, ...] ) ]
-- [ WHERE condition ]
-- ---

COPY product
FROM '/home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/products-data/product.csv'
DELIMITER ',' CSV HEADER;

COPY styles
FROM '/home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/products-data/styles.csv'
DELIMITER ',' NULL as 'null' CSV HEADER;

COPY features
FROM '/home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/products-data/features.csv'
DELIMITER ',' CSV HEADER;

-- COPY photos
-- FROM '/home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/products-data/photos.csv'
-- DELIMITER ',' CSV HEADER;

-- COPY skus
-- FROM '/home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/products-data/skus.csv'
-- DELIMITER ',' CSV HEADER;

-- COPY related
-- FROM '/home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/products-data/related.csv'
-- DELIMITER ',' CSV HEADER;