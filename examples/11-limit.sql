-- dve tabulky se stejnou strukturou 1M radek s hodnotami 0-9999
CREATE TABLE t11a (id INT);
CREATE TABLE t11b (id INT);

-- prvni obsahuje data "round-robin": 0, 1, 2, ..., 9999, 0, 1, 2 ... 9999, ...
INSERT INTO t11a SELECT mod(i,10000) FROM generate_series(1,1000000) s(i);

-- druha obsahuje data "po skupinach":  0, 0, ..., 0, 1, 1, ..., 1, 2 ...
INSERT INTO t11b SELECT (i/100)      FROM generate_series(1,1000000) s(i);

ANALYZE t11a;
ANALYZE t11b;

-- standardni plany pro dotazy nad tabulkami (bez LIMIT)
EXPLAIN ANALYZE SELECT * FROM t11a WHERE id = 9999;
EXPLAIN ANALYZE SELECT * FROM t11b WHERE id = 9999;

-- podivejme se na "LIMIT" plany pro obe tabulky
EXPLAIN ANALYZE SELECT * FROM t11a WHERE id = 9999 LIMIT 1;
EXPLAIN ANALYZE SELECT * FROM t11b WHERE id = 9999 LIMIT 1;
