-- dve tabulky, t12_child odkazuje na t12_parent
CREATE TABLE t12_parent (id INT PRIMARY KEY);
CREATE TABLE t12_child  (id  INT PRIMARY KEY,
                         parent_id INT REFERENCES t12_parent(id));

-- vsechna data v t12_child zavisi na jedinem radku v t12_parent
INSERT INTO t12_parent SELECT i FROM generate_series(1,100) s(i);
INSERT INTO t12_child  SELECT i, 1 from generate_series(0,100000) s(i);

-- odstraneni hodnot z rodicovske tabulky, ale jenom tech bez zavislych radek
EXPLAIN ANALYZE DELETE FROM t12_parent WHERE id > 1;
