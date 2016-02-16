-- dve jednoduche tabulky, kazda s 10.000 radek
CREATE TABLE t15a AS SELECT i FROM generate_series(1,1000000) s(i);
CREATE TABLE t15b AS SELECT i FROM generate_series(1,1000000) s(i);

CREATE INDEX t15a_idx ON t15a(i);
CREATE INDEX t15b_idx ON t15b(i);

ANALYZE t15a;
ANALYZE t15b;

-- kartezsky soucin tabulek
EXPLAIN SELECT * FROM t15a, t15b;

-- join
EXPLAIN SELECT * FROM t15a JOIN t15b USING (i) ORDER BY i;
