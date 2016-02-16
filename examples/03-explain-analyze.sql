-- tabulky s trivialni strukturou
CREATE TABLE t3a (id INT);
CREATE TABLE t3b (id INT);

-- naplneni 1M radek do kazde tabulky
INSERT INTO t3a SELECT i FROM generate_series(1,1000000) s(i);
INSERT INTO t3b SELECT i FROM generate_series(1,1000000) s(i);

ANALYZE t3a;
ANALYZE t3b;

-- pouze explain (bez instrumentace)
EXPLAIN SELECT * FROM t3a JOIN t3b ON (t3a.id = t3b.id);

-- zakladni analyze dotazu
EXPLAIN ANALYZE SELECT * FROM t3a JOIN t3b ON (t3a.id = t3b.id);

-- bez casovani (nejvetsi overhead)
EXPLAIN (ANALYZE, TIMING OFF) SELECT * FROM t3a JOIN t3b ON (t3a.id = t3b.id);

-- nebo naopak s dalsimi dodatecnymi informacemi
EXPLAIN (ANALYZE, VERBOSE) SELECT * FROM t3a JOIN t3b ON (t3a.id = t3b.id);
