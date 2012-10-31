CREATE TABLE a (id INT);
CREATE TABLE b (id INT);

INSERT INTO a SELECT i FROM generate_series(1,1000) s(i);
INSERT INTO b SELECT i FROM generate_series(1,1000) s(i);

ANALYZE a;
ANALYZE b;

EXPLAIN SELECT * FROM a JOIN b ON (a.id = b.id);
