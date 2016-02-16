
-- vytvor tabulku se dvema sloupci
CREATE TABLE t1 (a INT, b TEXT);

-- vloz do ni 10000 radek, zkonstruovanych tak aby zabraly 1000 stranek
INSERT INTO t1 SELECT i, REPEAT(md5(i::TEXT),23) FROM generate_series(1,10000) s(i);

-- posbirat statistiky
ANALYZE t1;

-- zobraz statistiky
SELECT relpages, reltuples FROM pg_class WHERE relname = 't1';

-- zobraz dotaz
EXPLAIN SELECT * FROM t1 WHERE a = 100;
