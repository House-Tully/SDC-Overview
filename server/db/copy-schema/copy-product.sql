-- ---
-- COPY Table 'product'
--
-- ---
-- psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/copy-schema/copy-product.sql

COPY product
FROM '/home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/products-data/product.csv'
DELIMITER ',' CSV HEADER;
