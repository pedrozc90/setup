# [PostgreSQL](https://www.postgresql.org/)

## References

-   [Tuning PostgreSQL with pgbench](https://www.cloudbees.com/blog/tuning-postgresql-with-pgbench)
-   **DockerHub**
    -   [Postgres](https://hub.docker.com/_/postgres)
    -   [PgHero](https://hub.docker.com/r/ankane/pghero)
        -   [Query Stats](https://github.com/ankane/pghero/blob/master/guides/Query-Stats.md)

## Tunning

> postgres.conf

### Connections

-   **max_connections**
    -   in an ideal world matches the number of CPU cores, but often 2:1 or 4:1.
        -   consider using a pooler if there's a need for hundreds of connections.

### Resources Usage

-   **shared_buffer**
    -   main 'database cache'. Depends on RAM, no more than 50% of what's available.
-   **work_mem**
    -   'working' memory for queries. this is per sort/hash table operation, so be carful.
-   **maintenant_work_mem**
    -   memory used for maintenance operations such as VACUUM. depends on the available RAM, but usually 1-4GB.
-   **autovacuum_work_mem**
    -   if -1, uses **maintenance_work_mem**.
-   **effective_io_connections**
    -   number of IO operations that can be expected to execute in parallel.
    -   depends on the drivers, usually a few hundred for SSDs and NVMe drivers.

### WAL

-   **wal_compression**
    -   set the to **on** in most cases, to reduce I/O at the cost of some CPU.
-   **wal_log_hints**
    -   log hint bits in WAL. Useful for pg_rewind, so always **on**.
-   **wal_buffers**
    -   the amount of shared memory used for un-written WAL data. 64MB is recommended (4 WAL files).
-   **checkpoint_completion_target**
    -   the target checkpoint completion time, as a fraction of the time between checkpoints.
    -   0.5 by default prior to v14.
    -   0.9 as of v14, and use that value for all postgres versions.
-   **checkpoint_timeout**
    -   maximum time between checkpoints.
    -   depends on the database load. longer timeout may end up with longer recovery times, lower value may end up with more I/O (and also full page writes).
-   **max_wal_size**
    -   causes a checkpoint on X MB of WAL has been written.
    -   set this to a value high enough so that postgres will checkpoint because of checkpoint_timeout.
    -   soft limit.

### Query

-   **seq_page_cost**
    -   cost of reading a page sequentially from disk.
-   **random_page_cost**
    -   cost of reading a random pagfe from disk.
    -   faster drivers -> lower costs
-   **cpu_tuple_cost**
    -   cost of processog one row (tuple) in a query.
    -   start with 0.03
-   **effective_cache_size**
    -   a hint to the query planner, not a "reserved" space unlike **shared_buffers**
    -   usually 50%-75% of the available RAM.

### Client connection defaults

-   **idle_in_trasaction_session_timeout**
    -   used to terminate sessions that remain idle in a transaction for too long.
    -   avoids locks and maintenance issues.
-   **shared_preload_libraries**
    -   **pg_stat_statement**: very useful for monitoring/tunning queries.

### Autovacuum
-   **log_autovacuum_min_duration**
    -   logs autovacuum durations.
    -   0 logs all of them.
-   **autovacuum_max_workers**
    -   more workers -> more frequent vacuum/analyze
    -   5 as a starting point.
-  **autovacuum_vacuum_cost_limit**
    -   useful for throttling autovacuum/autoanalyze
    -   3000 is a good starting point.

### Reporting and Logging
-   **log_temp_files**
    -   useful for logginf temp files, caused by lack of work_mem parameter.
-   **logs_checkpoints**
    -   useful for processing checkpoint performance. set to **on**.
-   **timed_statistics** (EPAS-only)
    -   DRITA: Dynamic Runtime Instrumentatio Tools Architecture
    -   set this to **on**.

-   **log_min_duration_statement**
-   **log_line_prefix**
    -   '%t [%p]: [%l-1] %quser=%u,db=%d,app=%a,client=%h '
-   **log_checkpoints**
-   **log_connections**
-   **log_disconnections**
-   **log_lock_waits**
-   **log_temp_files**
-   **log_autovacuum_min_duration**

> **application name**

```sql
SELECT
    opts.name,
    pg_settings.setting,
    pg_settings.unit
FROM (
    VALUES
    -- connections
    ('max_connections'),
    -- resources usage
    ('shared_buffer'),
    ('work_mem'),
    ('maintenant_work_mem'),
    ('autovacuum_work_mem'),
    ('effective_io_connections'),
    -- WAL
    ('wal_compression'),
    ('wal_log_hints'),
    ('wal_buffers'),
    ('checkpoint_completion_target'),
    ('checkpoint_timeout'),
    ('max_wal_size'),
    -- query
    ('seq_page_cost'),
    ('random_page_cost'),
    ('cpu_tuple_cost'),
    ('effective_cache_size'),
    -- client
    ('idle_in_trasaction_session_timeout'),
    ('shared_preload_libraries'),
    -- vacuum
    ('log_autovacuum_min_duration'),
    ('autovacuum_max_workers'),
    ('autovacuum_vacuum_cost_limit')
) AS opts (name)
LEFT JOIN pg_settings ON pg_settings.name = opts.name;
```

## Slow Queries

1. set a **x** value for **log_min_duration_statement**, so that all queries that takes more that **x** will be logged.

## Rewriting Queryies

### Naked Columns

> Expressions can prevent use of indexes

```sql
-- avoid the following expression
SELECT * FROM t WHERE t.inserted_at + interval '3 days' < current_timestamp;
```

```sql
-- instead, use naked columns
SELECT * FROM t WHERE t.inserted_at < current_timestamp - interval '3 days';
```

### Avoid

```sql
SELECT * FROM t WHERE t.name NOT IN (SELECT ...);
```
