-- ---
-- COPY Table 'features'
--
-- ---
-- psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/schema/copy-features.sql

COPY features
FROM '/home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/products-data/features.csv'
DELIMITER ',' CSV HEADER;
