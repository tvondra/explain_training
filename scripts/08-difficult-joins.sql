CREATE TABLE a AS SELECT 2*i AS i FROM generate_series(1,100000) s(i);

ANALYZE a;

EXPLAIN SELECT * FROM a a1 JOIN a a2 ON (a1.i = a2.i);
EXPLAIN SELECT * FROM a a1 JOIN a a2 ON (a1.i = a2.i-1);
