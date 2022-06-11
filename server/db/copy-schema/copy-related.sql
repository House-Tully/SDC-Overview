-- ---
-- COPY Table 'realated'
--
-- ---
-- psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/schema/copy-related.sql

COPY related
FROM '/home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/products-data/related.csv'
DELIMITER ',' CSV HEADER;
