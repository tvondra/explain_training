EXPLAIN ANALYZE SELECT * FROM generate_series(1,100);
EXPLAIN ANALYZE SELECT * FROM generate_series(1,1000000);
EXPLAIN ANALYZE SELECT * FROM generate_series(1,1000000) s(i) WHERE i < 100;
