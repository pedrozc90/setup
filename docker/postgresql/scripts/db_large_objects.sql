-- remove large objects with no relationchips
SELECT lo_unlink(lo.loid) FROM pg_largeobject lo
GROUP BY lo.loid
HAVING (NOT EXISTS (SELECT 1 FROM arquivos a WHERE a.content = lo.loid));

-- clear disk space
VACUUM FULL ANALYZE pg_largeobject;
VACUUM FULL VERBOSE ANALYSE;

-- large objects
select
    (SELECT count(*) FROM pg_largeobject) as rows,
    (SELECT pg_size_pretty(pg_table_size('pg_largeobject'))) as size;
