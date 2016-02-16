-- dve jednoduche tabulky, kazda s 10.000 radek
CREATE TABLE t13a AS SELECT i FROM generate_series(1,10000) s(i);
CREATE TABLE t13b AS SELECT i FROM generate_series(1,10000) s(i);

ANALYZE t13a;
ANALYZE t13b;

-- kartezsky soucin tabulek
EXPLAIN SELECT * FROM t13a, t13b;

-- neindexovatelna podminka
EXPLAIN SELECT * FROM t13a JOIN t13b ON (t13a.i <= t13b.i);

-- indexovatelna podminka
CREATE INDEX t13b_idx ON t13b(i);

EXPLAIN SELECT * FROM t13a JOIN t13b ON (t13a.i <= t13b.i);
