-- tabulka s jednim sloupcem a 1M radek
CREATE TABLE t10 AS SELECT i FROM generate_series(1,1000000) s(i);
ANALYZE t10;

EXPLAIN ANALYZE SELECT * FROM t10 ORDER BY i;

CREATE INDEX t10_idx ON t10(i);
ANALYZE t10;

EXPLAIN ANALYZE SELECT * FROM t10 ORDER BY i;

-- udelejme druhou tabulku, ale razenou nahodne
CREATE TABLE t10b AS SELECT i FROM generate_series(1,1000000) s(i) ORDER BY random();
CREATE INDEX t10b_idx ON t10b(i);
ANALYZE t10b;

EXPLAIN ANALYZE SELECT * FROM t10b ORDER BY i;
