SELECT
    pg_indexes.schemaname                                           AS "schema",
    pg_indexes.tablename                                            AS "table_name",
    pg_indexes.indexname                                            AS "index_name",
    pg_indexes.indexdef                                             AS "index_definition",
    -- index statistics
    pg_stat_indexes.idx_scan                                        AS "index_scans_count",
    pg_stat_indexes.idx_tup_read                                    AS "index_tuples_reads",
    pg_stat_indexes.idx_tup_fetch                                   AS "index_tuples_fetch",
    pg_relation_size(pg_stat_indexes.indexrelid)                    AS "index_size_bytes",
    pg_size_pretty(pg_relation_size(pg_stat_indexes.indexrelid))    AS "index_size",
    -- table statistics
    pg_stat_tables.seq_scan                                         AS "table_seq_scans_count",
    pg_stat_tables.seq_tup_read                                     AS "table_seq_reads_count",
    pg_stat_tables.idx_scan                                         AS "table_index_scans_count",
    pg_stat_tables.idx_tup_fetch                                    AS "table_index_reads_count",
    pg_stat_tables.seq_scan + pg_stat_tables.idx_scan               AS "table_scans_count",
    pg_stat_tables.seq_tup_read + pg_stat_tables.idx_tup_fetch      AS "table_reads_count",
    (
            pg_stat_tables.n_tup_ins                                    -- number of rows inserted
            + pg_stat_tables.n_tup_upd                                  -- number of rows updated
            + pg_stat_tables.n_tup_del                                  -- number of rows deleted
        )                                                               AS "table_writes_count",
    pg_relation_size(pg_stat_tables.relid)                          AS "table_size_bytes",
    pg_size_pretty(pg_relation_size(pg_stat_tables.relid))          AS "table_size"
FROM pg_indexes
JOIN pg_stat_user_indexes AS pg_stat_indexes ON (pg_indexes.indexname = pg_stat_indexes.indexrelname AND pg_indexes.schemaname = pg_stat_indexes.schemaname)
JOIN pg_stat_user_tables AS pg_stat_tables ON (pg_stat_tables.relid = pg_stat_indexes.relid)
WHERE 1 = 1
  AND pg_indexes.indexdef !~* 'unique'
--   AND pg_stat_indexes.schemaname !~* 'sensormatic'
--   AND pg_stat_indexes.relname ~* 'cidades'
--   AND pg_stat_indexes.relname ~* 'logs_'
--   AND pg_indexes.indexname ~* 'faturamentos'
ORDER BY index_name DESC
-- ORDER BY index_scans_count DESC, index_size_bytes DESC
;
