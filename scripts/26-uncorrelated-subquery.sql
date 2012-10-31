CREATE TABLE a (id INT PRIMARY KEY);
CREATE TABLE b (id INT PRIMARY KEY, a_id INT REFERENCES a (id),
                val INT, UNIQUE (a_id));

INSERT INTO a SELECT i               FROM generate_series(1,10000) s(i);
INSERT INTO b SELECT i, i, mod(i,23) FROM generate_series(1,10000) s(i);

ANALYZE a;
ANALYZE b;

EXPLAIN SELECT a.id, (SELECT val FROM b LIMIT 1) AS val FROM a;


-- rewritten as a join
EXPLAIN SELECT a.id, x.val FROM a, (SELECT val FROM b LIMIT 1) x;

