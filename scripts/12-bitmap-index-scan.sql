CREATE TABLE a AS SELECT mod(i,100) AS x,
                         mod(i,101) AS y FROM generate_series(1,1000000) s(i);
CREATE INDEX ax_idx ON a(x);
CREATE INDEX ay_idx ON a(y);

EXPLAIN SELECT * FROM a WHERE x < 5 AND y < 5;
