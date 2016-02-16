-- dve jednoduche tabulky, kazda s 10.000 radek
CREATE TABLE t14a AS SELECT i FROM generate_series(1,10000) s(i);
CREATE TABLE t14b AS SELECT i FROM generate_series(1,10000) s(i);

ANALYZE t14a;
ANALYZE t14b;

-- kartezsky soucin tabulek
EXPLAIN SELECT * FROM t14a, t14b;

-- podminka
EXPLAIN SELECT * FROM t14a JOIN t14b USING (i);
