CREATE TABLE a (i INT, j INT, k INT);
INSERT INTO a SELECT mod(i, 1000), mod(i, 1333), mod(i,3498)
                FROM gs(1,100000) s(i);

EXPLAIN SELECT i, count(*) FROM a GROUP BY i;

EXPLAIN SELECT DISTINCT i  FROM a GROUP BY i;

-- going to be killed by OOM
-- EXPLAIN ANALYZE SELECT i, count(*) FROM generate_series(1,100000000) s(i) GROUP BY i;
