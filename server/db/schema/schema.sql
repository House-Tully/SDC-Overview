-- ---
-- Start PostgreSQL
-- ---

-- sudo service postgresql stop;

-- sudo service postgresql start;

-- sudo service postgresql restart;

-- sudo -i -u postgres;

-- psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/schema/schema.sql

-- ---
-- Create and use database
-- ---

DROP DATABASE IF EXISTS products;

CREATE DATABASE products;

\connect products;

-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ALTER TABLE `products` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `styles` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `features` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `photos` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `skus` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `realated` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- copy data from .csv files to database
-- ---
-- COPY table_name [ ( column_name [, ...] ) ]
-- FROM { 'filename' | PROGRAM 'command' | STDIN }
-- [ [ WITH ] ( option [, ...] ) ]
-- [ WHERE condition ]
-- ---










