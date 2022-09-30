SELECT
    pg_stat_activity.datid,
    pg_stat_activity.pid,
    pg_stat_activity.usename,
    pg_stat_activity.query_start,
    extract(epoch from now() - pg_stat_activity.query_start)	as duration_s,
    pg_stat_activity.state,
    regexp_replace(pg_stat_activity.query, '\s+', ' ', 'g')       as query
FROM pg_stat_activity
WHERE 1 = 1
  AND pg_stat_activity.query != 'SELECT 1'
  AND pg_stat_activity.query != 'COMMIT'
  AND (now() - pg_stat_activity.query_start) > '0 s'::interval
ORDER BY pg_stat_activity.state ASC;

-- cancel query
SELECT pg_cancel_backend(__pid__);

-- kill process (warning: it can lead to a full database restart)
SELECT pg_terminate_backend(__pid__);
