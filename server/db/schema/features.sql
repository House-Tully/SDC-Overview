-- ---
-- Table 'features'
--
-- ---
-- psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/schema/features.sql

DROP TABLE IF EXISTS features;

CREATE TABLE features (
  id SERIAL NOT NULL,
  product_id INTEGER NOT NULL,
  feature VARCHAR(250) NOT NULL,
  value VARCHAR(250) NOT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE features ADD FOREIGN KEY (product_id) REFERENCES product (id);
