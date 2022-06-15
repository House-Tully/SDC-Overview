-- ---
-- Start PostgreSQL
-- ---

-- sudo service postgresql stop;

-- sudo service postgresql start;

-- sudo service postgresql restart;

-- sudo -i -u postgres;

-- psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/schema/schema.sql

-- ---
-- Create and use database
-- ---
DROP DATABASE IF EXISTS temp;

CREATE DATABASE temp;

\connect temp;

DROP DATABASE IF EXISTS products;

CREATE DATABASE products;

\connect products;

-- ---
-- Globals
-- ---


-- ---
-- create indexes
-- ---
DROP TABLE IF EXISTS product CASCADE;
DROP TABLE IF EXISTS features CASCADE;
DROP TABLE IF EXISTS styles CASCADE;
DROP TABLE IF EXISTS related;
DROP TABLE IF EXISTS photos;
DROP TABLE IF EXISTS skus;

DROP INDEX If EXISTS features_product_id_index;
DROP INDEX If EXISTS styles_productId_index;
DROP INDEX If EXISTS current_product_id_index;
DROP INDEX If EXISTS photos_styleId_index;
DROP INDEX If EXISTS skus_styleId_index;

CREATE TABLE product (
  id SERIAL PRIMARY KEY,
  name VARCHAR(250) NOT NULL,
  slogan VARCHAR(500) NOT NULL,
  description VARCHAR(2000) NOT NULL,
  category VARCHAR(100) NOT NULL,
  default_price DECIMAL NOT NULL
);

CREATE TABLE features (
  id SERIAL PRIMARY KEY,
  product_id INT REFERENCES product(id),
  feature VARCHAR(250) NOT NULL,
  value VARCHAR(250) NOT NULL
);

CREATE TABLE styles (
  id SERIAL PRIMARY KEY,
  productId INT REFERENCES product(id),
  name VARCHAR(100) NOT NULL,
  sale_price VARCHAR(20),
  original_price VARCHAR(30) NOT NULL,
  default_style BOOLEAN NOT NULL DEFAULT false
);

CREATE TABLE photos (
  id SERIAL PRIMARY KEY,
  styleId INT REFERENCES styles(id),
  thumbnail_url VARCHAR NOT NULL,
  url VARCHAR NOT NULL
);

CREATE TABLE skus (
  id SERIAL PRIMARY KEY,
  styleId INT REFERENCES styles(id),
  size VARCHAR(50) NOT NULL,
  quantity INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE related (
  id SERIAL PRIMARY KEY,
  current_product_id INTEGER NOT NULL,
  related_product_id INTEGER NOT NULL
);

-- ALTER TABLE features ADD FOREIGN KEY (product_id) REFERENCES product (id);
-- ALTER TABLE styles ADD FOREIGN KEY (productId) REFERENCES product (id);
-- ALTER TABLE photos ADD FOREIGN KEY (styleID) REFERENCES styles (id);
-- ALTER TABLE skus ADD FOREIGN KEY (styleID) REFERENCES styles (id);
-- ALTER TABLE related ADD FOREIGN KEY (current_product_id) REFERENCES product (id);

COPY product
FROM '/home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/products-data/product.csv'
DELIMITER ',' CSV HEADER;

COPY features
FROM '/home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/products-data/features.csv'
DELIMITER ',' CSV HEADER;

COPY styles
FROM '/home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/products-data/styles.csv'
DELIMITER ',' CSV HEADER;

COPY photos
FROM '/home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/products-data/photos.csv'
DELIMITER ',' CSV HEADER;

COPY skus
FROM '/home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/products-data/skus.csv'
DELIMITER ',' CSV HEADER;

COPY related
FROM '/home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/products-data/related.csv'
DELIMITER ',' CSV HEADER;

-- CREATE INDEX features_product_id_index ON features (product_id);
-- CREATE INDEX styles_productId_index ON styles (ProductId);
-- CREATE INDEX current_product_id_index ON related (current_product_id);
-- CREATE INDEX photos_styleId_index ON photos (styleId);
-- CREATE INDEX skus_styleId_index ON skus (styleId);

-- ---
-- copy data from .csv files to database
-- ---
-- COPY table_name [ ( column_name [, ...] ) ]
-- FROM { 'filename' | PROGRAM 'command' | STDIN }
-- [ [ WITH ] ( option [, ...] ) ]
-- [ WHERE condition ]
-- ---