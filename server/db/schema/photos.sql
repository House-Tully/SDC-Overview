-- ---
-- Table 'photos'
--
-- ---
-- psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/schema/photos.sql

DROP TABLE IF EXISTS photos;

CREATE TABLE photos (
  id SERIAL,
  styleId INTEGER NOT NULL,
  thumbnail_url VARCHAR NOT NULL,
  url VARCHAR NOT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE photos ADD FOREIGN KEY (styleID) REFERENCES styles (id);
