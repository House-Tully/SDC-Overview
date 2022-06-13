-- -- ---
-- -- COPY Table 'skus'
-- --
-- -- ---
-- -- psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/schema/copy-skus.sql

COPY skus
FROM '/home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/products-data/skus.csv'
DELIMITER ',' CSV HEADER;
