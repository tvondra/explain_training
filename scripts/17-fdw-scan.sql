CREATE EXTENSION file_fdw;
CREATE SERVER csv FOREIGN DATA WRAPPER file_fdw;

CREATE FOREIGN TABLE csv_import (
  process_id integer,
  message text
)SERVER csv OPTIONS ( filename '/tmp/my.csv', format 'csv' );

EXPLAIN ANALYZE SELECT * FROM csv_import;
