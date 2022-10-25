-- Reference:
-- https://www.postgresql.org/docs/current/pgstatstatements.html

CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

SELECT pg_stat_statements_reset();

-- slow queries
SELECT
    pg_roles.rolname							AS "user",
    (pg_stat_statements.total_exec_time / 3600000)::numeric(19, 5)      AS "total_exec_time_hours",
    (pg_stat_statements.total_exec_time / 1000)::numeric(19, 5)         AS "total_exec_time_seconds",
    pg_stat_statements.max_exec_time::numeric(19, 5)                    AS "max_exec_time",
    pg_stat_statements.min_exec_time::numeric(19, 5)                    AS "min_exec_time",
    pg_stat_statements.mean_exec_time::numeric(19, 5)                   AS "avg_exec_time",
    pg_stat_statements.stddev_exec_time::numeric(19,5)                  AS "stddev_exec_time",
    pg_stat_statements.calls                                            AS "calls",
    regexp_replace(pg_stat_statements.query, '\s{2,}', ' ', 'g')        AS "query"
FROM pg_stat_statements
LEFT JOIN pg_roles ON pg_roles.oid = pg_stat_statements.userid
WHERE 1 = 1
--   AND query !~ 'COMMIT'
--   AND query !~ 'BEGIN'
--   AND query !~ 'ROLLBACK'
--   AND query !~ 'CREATE'           -- ignore CREATE INDEX, TABLE, etc.
--   AND query !~ 'ALTER'            -- ignore ALTER TABLE
--   AND query !~ 'COPY'
--   AND query !~ 'SELECT'
--   AND query !~ 'EXPLAIN'
--   AND query !~ 'VACUUM'
--   AND query !~ 'DATABASE'
--   AND query !~ 'TABLE'
--   AND query !~ 'CALL'
--   AND query !~* 'DROP'
--   AND query !~* 'insert'
--   AND query !~* 'update'
--   AND query !~ 'pg_'              -- ignore postgres tables
--   AND query !~ 'vw_'              -- ignore views
--   AND query !~ 'play_evolutions'
--   AND query !~ 'nextval'
-- AND query ~ '.situacao_bureau'
ORDER BY total_exec_time DESC
;
