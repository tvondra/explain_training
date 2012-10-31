CREATE TABLE a (id INT);
INSERT INTO a SELECT mod(i,100) FROM generate_series(1,10000) s(i);
ANALYZE a;

EXPLAIN ANALYZE SELECT id, COUNT(*) FROM a GROUP BY id;

BEGIN;

    -- prevents autoanalyze from kicking in
    LOCK a IN ACCESS EXCLUSIVE MODE;
    TRUNCATE a;

    INSERT INTO a SELECT i FROM generate_series(1,100000) s(i);

    -- wrong distinct estimate
    EXPLAIN ANALYZE SELECT id, COUNT(*) FROM a GROUP BY id;

COMMIT;
