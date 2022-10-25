-- Reference:
-- https://www.postgresql.org/docs/current/monitoring-stats.html#MONITORING-PG-STAT-ACTIVITY-VIEW

SELECT
    datid,
    pid,
    usename,
    query_start,
    extract(epoch from now() - query_start)     as duration_s,
    state,
    regexp_replace(query, '\s+', ' ', 'g')      as query
FROM pg_stat_activity
WHERE 1 = 1
--   AND (now() - query_start) > '0 s'::interval
ORDER BY duration_s DESC NULLS LAST;

-- cancel query
SELECT pg_cancel_backend(__pid__);

-- kill process (warning: it can lead to a full database restart)
SELECT pg_terminate_backend(__pid__);
