CREATE TABLE a (id INT PRIMARY KEY);
CREATE TABLE b (id INT PRIMARY KEY);

INSERT INTO a SELECT i FROM generate_series(1,10000) s(i);
INSERT INTO b SELECT i FROM generate_series(1,10000) s(i);

ANALYZE a;
ANALYZE b;

EXPLAIN SELECT * FROM a WHERE EXISTS (SELECT 1 FROM b WHERE id = a.id);

EXPLAIN SELECT * FROM a WHERE id IN (SELECT id FROM b);

EXPLAIN SELECT * FROM a WHERE NOT EXISTS (SELECT id FROM b WHERE id = a.id);

EXPLAIN SELECT * FROM a WHERE id NOT IN (SELECT id FROM b);
