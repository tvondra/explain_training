CREATE TABLE a (id INT PRIMARY KEY);
CREATE TABLE b (id INT PRIMARY KEY, a_id INT REFERENCES a (id),
                val INT, UNIQUE (a_id));

INSERT INTO a SELECT i               FROM generate_series(1,10000) s(i);
INSERT INTO b SELECT i, i, mod(i,23) FROM generate_series(1,10000) s(i);

ANALYZE a;
ANALYZE b;

EXPLAIN ANALYZE
  SELECT a.id, (SELECT val FROM b WHERE a_id = a.id) AS val FROM a;

-- rewritten as join (not exactly the same behaviour)
EXPLAIN ANALYZE
  SELECT a.id, b.val FROM a LEFT JOIN b ON (a.id = b.a_id);
