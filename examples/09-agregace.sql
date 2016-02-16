-- tabulka s 1M radek s 1k, 10k a 100k unikatnimi hodnot
CREATE TABLE t9 (i INT, j INT, k INT);
INSERT INTO t9 SELECT mod(i, 1000), mod(i, 10000), mod(i,100000)
                FROM generate_series(1,1000000) s(i);

ANALYZE t9;

-- agregace bez deleni do skupin
EXPLAIN SELECT count(*) FROM t9;

-- agregace s ruznymi pocty skupin
EXPLAIN SELECT i, count(*) FROM t9 GROUP BY i;
EXPLAIN SELECT j, count(*) FROM t9 GROUP BY j;
EXPLAIN SELECT k, count(*) FROM t9 GROUP BY k;
