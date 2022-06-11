to create and copy entire database execute this in terminal as postgres:

psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/schema/schema.sql;
psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/schema/product.sql;
psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/schema/styles.sql;
psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/schema/features.sql;
psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/schema/photos.sql;
psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/schema/skus.sql;
psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/schema/related.sql;
psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/copy-schema/copy-product.sql;
psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/copy-schema/copy-styles.sql;
psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/copy-schema/copy-features.sql;
psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/copy-schema/copy-photos.sql;
psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/copy-schema/copy-skus.sql;
psql -d products -f /home/dincohen92/hackreactor/rfp2204/SDC-Overview/server/db/copy-schema/copy-related.sql;