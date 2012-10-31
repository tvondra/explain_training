CREATE TABLE a (id INT, val INT8);
INSER INTO a SELECT i,i FROM generate_series(1,1000000) s(i);
CREATE INDEX a_idx on a(id, val);
