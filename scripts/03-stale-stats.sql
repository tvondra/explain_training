CREATE TABLE stale_t (id int);
INSERT INTO stale_t SELECT i FROM generate_series(1,100000) s(i);

-- bad estimate
EXPLAIN ANALYZE SELECT id FROM stale_t WHERE id < 100;

ANALYZE;

-- good estimate
EXPLAIN ANALYZE SELECT id FROM stale_t WHERE id < 100;
