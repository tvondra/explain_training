-- jednoducha tabulka
CREATE TABLE t4 (id int);
INSERT INTO t4 SELECT i FROM generate_series(1,100000) s(i);

-- preskocit analyzu
-- ANALYZE t4;

-- zobrazit plan (pouziva 33% odhad pro podminku)
EXPLAIN ANALYZE SELECT id FROM t4 WHERE id < 100;

-- posbirat statistiky
ANALYZE t4;

-- spustit znovu
EXPLAIN ANALYZE SELECT id FROM t4 WHERE id < 100;
