CREATE TABLE a (i int, j int);
INSERT INTO a SELECT i,i FROM generate_series(1,1000000) s(i);

ANALYZE a;
EXPLAIN ANALYZE SELECT * FROM a WHERE (a.i < 1000 AND a.j < 1000);

-- OFFSET optimization boundary trick
-- EXPLAIN ANALYZE SELECT * FROM (SELECT * FROM a WHERE a.i < 1000 OFFSET 0) foo WHERE j < 1000;
