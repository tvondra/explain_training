CREATE TABLE a AS SELECT i, md5(i::text) val FROM generate_series(1,100000) s(i);
CREATE TABLE b AS SELECT i, md5(i::text) val FROM generate_series(1,100000) s(i);
CREATE INDEX a_idx ON a(i);
CREATE INDEX b_idx ON b(i);
ANALYZE a;
ANALYZE b;

EXPLAIN SELECT * FROM a JOIN b USING (i);
EXPLAIN ANALYZE SELECT * FROM a JOIN b USING (i);

-- withouth an index
DROP INDEX b_idx;

EXPLAIN SELECT * FROM a JOIN b USING (i) ORDER BY i;
EXPLAIN ANALYZE SELECT * FROM a JOIN b USING (i) ORDER BY i;


-- with indexes
CREATE TABLE a AS SELECT i, i/10 j FROM generate_series(1,1000000) s(i);
CREATE TABLE b AS SELECT i/10 i FROM generate_series(1,1000000) s(i);

CREATE INDEX a_idx ON a(j);
CREATE INDEX b_idx ON b(i);

EXPLAIN SELECT * FROM a JOIN b ON (a.j = b.i);
