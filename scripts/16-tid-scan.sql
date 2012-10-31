CREATE TABLE a AS SELECT i FROM generate_series(1,100000) s(i);

SELECT ctid, * FROM a;

EXPLAIN ANALYZE SELECT * FROM a WHERE ctid = '(10,3)'::tid;
