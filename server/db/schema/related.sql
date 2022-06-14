-- -- ---
-- -- Table 'realated'
-- --
-- -- ---
-- psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/schema/related.sql

DROP TABLE IF EXISTS related;

CREATE TABLE related (
  id INTEGER,
  current_product_id INTEGER NOT NULL,
  related_product_id INTEGER NOT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE related ADD FOREIGN KEY (current_product_id) REFERENCES product (id);

CREATE INDEX current_product_id_index ON related (current_product_id);