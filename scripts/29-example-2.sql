CREATE TABLE parent (id INT);
CREATE TABLE child_1 () INHERITS (parent);
CREATE TABLE child_2 () INHERITS (parent);

INSERT INTO child_1
SELECT i FROM generate_series(1,1000000) s(i);

INSERT INTO child_2
SELECT i FROM generate_series(1000000, 2000000) s(i);

ANALYZE parent;
ANALYZE child_1;
ANALYZE child_2;

EXPLAIN ANALYZE SELECT * FROM parent ORDER BY id DESC LIMIT 100;

-- CREATE INDEX child_1_idx ON child_1(id);
-- CREATE INDEX child_2_idx ON child_1(id);
-- EXPLAIN ANALYZE SELECT * FROM parent ORDER BY id DESC LIMIT 100;
