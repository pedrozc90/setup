-- databases
SELECT
    t1.datname                                      AS "db_name",
    pg_database_size(t1.datname)                    AS "db_size_bytes",
    pg_size_pretty(pg_database_size(t1.datname))    AS "db_size"
FROM pg_database t1
ORDER BY db_size_bytes DESC;

-- tables
SELECT
    t.schemaname                                                                    AS "schema",
    t.relname                                                                       AS "table_name",
    pg_relation_size(t.relid)                                                       AS "table_size_bytes",
    pg_size_pretty(pg_relation_size(t.relid))                                       AS "table_size",
    sum(pg_relation_size(t.relid)) OVER (PARTITION BY t.relname)                    AS "table_total_size_bytes",
    pg_size_pretty(sum(pg_relation_size(t.relid)) OVER (PARTITION BY t.relname))    AS "table_total_size"
FROM pg_stat_user_tables t
ORDER BY table_size_bytes DESC;

-- tables
SELECT
    s.table_name,
    sum(s.table_size_bytes)                                         AS "table_size_bytes",
    pg_size_pretty(sum(s.table_size_bytes))                         AS "table_size"
FROM (
    SELECT
        -- table_schema                                               AS "schema",
        table_name                                                 AS "table_name",
        pg_relation_size(concat(table_schema, '.', table_name))    AS "table_size_bytes"
    FROM information_schema.tables
    WHERE 1 = 1
      AND table_schema NOT IN ('pg_catalog', 'information_schema')
    ORDER BY table_size_bytes DESC
) AS s
GROUP BY table_name
ORDER BY table_size_bytes DESC;
