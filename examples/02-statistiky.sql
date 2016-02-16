-- tabulka se 4 sloupci
CREATE TABLE t2 (a INT, b INT, c INT, d INT);

-- 1M radek s ruznym statistickym rozdelenim
INSERT INTO t2
     SELECT
            MOD(i,50),              -- 50 hodnot (uniform)
            MID(i,1000),            -- 1000 hodnot (uniform)
            1000 * pow(random(),2), -- 1000 hodnot (skewed)
            (CASE WHEN MOD(i,3) = 0 THEN NULL ELSE i END)
FROM generate_series(1,1000000) s(i);

-- posbirat statistiky
ANALYZE t2;

-- zobrazit rozdeleni jednotlivych sloupcu
SELECT a, COUNT(*) FROM t2 GROUP BY 1 ORDER BY 1;
SELECT b, COUNT(*) FROM t2 GROUP BY 1 ORDER BY 1;
SELECT c, COUNT(*) FROM t2 GROUP BY 1 ORDER BY 1;
SELECT d, COUNT(*) FROM t2 GROUP BY 1 ORDER BY 1;

-- zobrazit statistiky
SELECT * FROM pg_stats WHERE tablename = 't2' AND attname = 'a';
SELECT * FROM pg_stats WHERE tablename = 't2' AND attname = 'b';
SELECT * FROM pg_stats WHERE tablename = 't2' AND attname = 'c';
SELECT * FROM pg_stats WHERE tablename = 't2' AND attname = 'd';
