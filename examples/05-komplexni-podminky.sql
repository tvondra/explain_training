-- tabulka s 1M radek
CREATE TABLE t5a AS SELECT i FROM generate_series(1,10000) s(i);
CREATE TABLE t5b AS SELECT d FROM generate_series('2010-1-1'::timestamp, '2015-1-1'::timestamp, '1 hour'::interval) s(d);

-- posbirat statistiky
ANALYZE t5a;
ANALYZE t5b;

-- komplikovana podminka nad INT sloupcem

EXPLAIN ANALYZE SELECT * FROM t5a WHERE i*i < -1;

CREATE INDEX t5a_idx ON t5a((i*i));

EXPLAIN ANALYZE SELECT * FROM t5a WHERE i*i < -1;

-- komplikovana podminka nad datumem

EXPLAIN ANALYZE SELECT * FROM t5b WHERE d::text LIKE '2013-01-%';

EXPLAIN ANALYZE SELECT * FROM t5b WHERE d BETWEEN '2013-01-01' AND '2013-01-02';

EXPLAIN ANALYZE SELECT * FROM t5b WHERE d >= '2013-01-01' AND d < '2013-01-02';
