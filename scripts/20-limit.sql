CREATE TABLE a (id INT);

-- bad estimate due to non-uniform distribution
INSERT INTO a SELECT i/100 FROM generate_series(1,1000000) s(i);
ANALYZE a;

EXPLAIN ANALYZE SELECT * FROM a WHERE id = 9999 LIMIT 1;

TRUNCATE a;

-- good estimate, uniform distribution
INSERT INTO a SELECT mod(i,10000) FROM generate_series(1,1000000) s(i);
ANALYZE a;

EXPLAIN ANALYZE SELECT * FROM a WHERE id = 9999 LIMIT 1;
