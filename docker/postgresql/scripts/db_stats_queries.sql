-- long queries
SELECT
    (total_time / 3600000)          AS "total_time_hours",
    (total_time / 1000)             AS "total_time_seconds",
    max_time,
    min_time,
    mean_time,
    calls,
    query
FROM pg_stat_statements
ORDER BY total_time_hours DESC;
