-- ---
-- COPY Table 'styles'
--
-- ---
-- psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/schema/copy-styles.sql

COPY styles
FROM '/home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/products-data/styles.csv'
DELIMITER ',' NULL as 'null' CSV HEADER;
