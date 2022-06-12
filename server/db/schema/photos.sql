-- ---
-- Table 'photos'
--
-- ---
-- psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/schema/photos.sql
-- --
-- .csv format
-- id,styleId,url,thumbnail_url
-- 1,1,"https://images.unsplash.com/photo-1501088430049-71c79fa3283e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80","https://images.unsplash.com/photo-1501088430049-71c79fa3283e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=300&q=80"


DROP TABLE IF EXISTS photos;

CREATE TABLE photos (
  id SERIAL,
  styleId INTEGER NOT NULL,
  thumbnail_url VARCHAR NOT NULL,
  url VARCHAR NOT NULL,
  PRIMARY KEY (id)
);

CREATE INDEX photos_index ON photos (id)
CREATE INDEX photos_index ON photos (styleId)

ALTER TABLE photos ADD FOREIGN KEY (styleID) REFERENCES styles (id);
