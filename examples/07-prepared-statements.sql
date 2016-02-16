-- tabulka s 100.001 radek a indexem nad jedinym sloupcem
CREATE TABLE t7 (val INT);
CREATE INDEX t7_idx ON t7(val);

-- z toho 100.000 je hodnota "1"
INSERT INTO t7 SELECT 1 FROM generate_series(1,100000) s(i);

-- a jedina radka ma hodnotu "2"
INSERT INTO t7 SELECT 2;

-- posbirat statistiky
ANALYZE t7;

-- bez prepared statementu
EXPLAIN SELECT * FROM t7 WHERE val = 1;
EXPLAIN SELECT * FROM t7 WHERE val = 2;

-- s prepared statementem
PREPARE select_t7(int) AS SELECT * FROM t7 WHERE val = $1;
EXPLAIN EXECUTE select_t7(1);
EXPLAIN EXECUTE select_t7(2);
DEALLOCATE select_t7;

-- s prepared statementem a demonstraci cache
PREPARE select_t7(int) AS SELECT * FROM t7 WHERE val = $1;
EXPLAIN EXECUTE select_t7(1);
EXPLAIN EXECUTE select_t7(1);
EXPLAIN EXECUTE select_t7(1);
EXPLAIN EXECUTE select_t7(1);
EXPLAIN EXECUTE select_t7(1);
EXPLAIN EXECUTE select_t7(2);
DEALLOCATE select_t7;
