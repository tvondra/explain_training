CREATE TABLE a AS SELECT i, md5(i::text) m
                    FROM generate_series(1,100000) s(i)
--                    ORDER BY random()
;

-- CREATE INDEX a_idx ON a(i);

\set selectivity 0.1

EXPLAIN SELECT * FROM a WHERE i < (100000 * :selectivity);
