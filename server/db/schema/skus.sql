-- -- ---
-- -- Table 'skus'
-- --
-- -- ---
-- psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/schema/skus.sql
-- id,styleId,size,quantity
-- 1,1,"XS",8
DROP TABLE IF EXISTS skus;

CREATE TABLE skus (
  id INTEGER,
  styleId INTEGER NOT NULL REFERENCES styles (id),
  size VARCHAR(50) NOT NULL,
  quantity INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
);

ALTER TABLE skus ADD FOREIGN KEY (styleID) REFERENCES styles (id);
