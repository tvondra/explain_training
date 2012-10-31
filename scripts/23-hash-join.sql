CREATE TABLE a AS SELECT i FROM generate_series(1,10000) s(i);
CREATE TABLE b AS SELECT i FROM generate_series(1,10000) s(i);
ANALYZE a;
ANALYZE b;

EXPLAIN SELECT * FROM a JOIN b USING (i) WHERE a.i < 1000;

DROP TABLE a;
DROP TABLE b;

CREATE TABLE a AS SELECT i FROM generate_series(1,1000000) s(i);
CREATE TABLE b AS SELECT i FROM generate_series(1,1000000) s(i);

EXPLAIN ANALYZE SELECT * FROM a JOIN b USING (i);
