-- tabulka se dvema sloupci, obsahujicimi presne stejne hodnoty
CREATE TABLE t6 (i int, j int);

-- a 1M radek
INSERT INTO t6 SELECT i, i FROM generate_series(1,1000000) s(i);

-- posbirejme aktualni statistiky
ANALYZE t6;

-- ukazka ze odhad jednotlivych podminek je spravny
EXPLAIN ANALYZE SELECT * FROM t6 WHERE (i < 1000);
EXPLAIN ANALYZE SELECT * FROM t6 WHERE (j < 1000);

-- pokusme se odhadnout kombinaci podminek na obou sloupcich
EXPLAIN ANALYZE SELECT * FROM t6 WHERE (i < 1000) AND (j < 1000);

-- nebo jinou podminku
EXPLAIN ANALYZE SELECT * FROM t6 WHERE (i < 500000) AND (j > 500000);
