-- ---
-- COPY Table 'photos'
--
-- ---
-- psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/schema/copy-photos.sql

COPY photos
FROM '/home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/products-data/photos.csv'
DELIMITER ',' CSV HEADER;
