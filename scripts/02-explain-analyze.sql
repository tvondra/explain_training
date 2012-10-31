CREATE TABLE a (id INT);
CREATE TABLE b (id INT);

INSERT INTO a SELECT i FROM generate_series(1,1000) s(i);
INSERT INTO b SELECT i FROM generate_series(1,1000) s(i);

ANALYZE a;
ANALYZE b;

EXPLAIN ANALYZE SELECT * FROM a JOIN b ON (a.id = b.id);

-- EXPLAIN (ANALYZE, TIMING OFF) SELECT * FROM a JOIN b ON (a.id = b.id);
-- EXPLAIN (ANALYZE, VERBOSE) SELECT * FROM a JOIN b ON (a.id = b.id);