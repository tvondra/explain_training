-- vytvorime tabulku s jednim sloupcem, obsahujicim pouze sude hodnoty
CREATE TABLE t8 AS SELECT 2*i AS i FROM generate_series(1,100000) s(i);

ANALYZE t8;

-- jednoducha "korektni" podminka
EXPLAIN SELECT * FROM t8 AS t8_a JOIN t8 AS t8_b ON (t8_a.i = t8_b.i);

-- problematicka podminka v joinu
EXPLAIN SELECT * FROM t8 AS t8_a JOIN t8 AS t8_b ON (t8_a.i = (t8_b.i - 1));
