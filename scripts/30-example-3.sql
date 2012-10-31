CREATE TABLE toasted (id SERIAL, val TEXT);
INSERT INTO toasted SELECT i, REPEAT(MD5(i::text),80)
                      FROM generate_series(1,1000000) s(i);
ANALYZE toasted;

-- fast
EXPLAIN ANALYZE SELECT id, LENGTH(val) FROM toasted;

-- slow
EXPLAIN ANALYZE SELECT id, LENGTH(id::text) FROM toasted;
