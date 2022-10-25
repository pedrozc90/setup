SELECT
    pg_indexes.schemaname                                                                      AS "schema",
    pg_indexes.tablename                                                                       AS "table_name",
    pg_indexes.indexname                                                                       AS "idx_name",
    pg_indexes.indexdef                                                                        AS "idx_definition",
    -- index statistics
    pg_stat_indexes.idx_scan                                                                   AS "idx_scans_count",
    pg_stat_indexes.idx_tup_read                                                               AS "idx_tuples_reads",
    pg_stat_indexes.idx_tup_fetch                                                              AS "idx_tuples_fetch",
    pg_relation_size(pg_stat_indexes.indexrelid)                                               AS "idx_size_bytes",
    pg_size_pretty(pg_relation_size(pg_stat_indexes.indexrelid))                               AS "idx_size",
    -- table statistics
    pg_stat_tables.seq_scan                                                                    AS "tb_seq_scans_count",
    pg_stat_tables.seq_tup_read                                                                AS "tb_seq_reads_count",
    pg_stat_tables.idx_scan                                                                    AS "tb_index_scans_count",
    pg_stat_tables.idx_tup_fetch                                                               AS "tb_index_reads_count",
    pg_stat_tables.seq_scan + pg_stat_tables.idx_scan                                          AS "tb_scans_count",
    pg_stat_tables.seq_tup_read + pg_stat_tables.idx_tup_fetch                                 AS "tb_reads_count",
    (
        pg_stat_tables.n_tup_ins    -- number of rows inserted
        + pg_stat_tables.n_tup_upd  -- number of rows updated
        + pg_stat_tables.n_tup_del  -- number of rows deleted
    )                                                                                           AS "tb_writes_count",
    (CASE WHEN (n_tup_ins + n_tup_upd + n_tup_del) != 0
        THEN (n_tup_ins::numeric / (n_tup_ins + n_tup_upd + n_tup_del))::numeric(12, 5)
        ELSE -1
    END)                                                                                        AS inserts_percentage,
    (CASE WHEN (n_tup_ins + n_tup_upd + n_tup_del) != 0
        THEN (n_tup_upd::numeric / (n_tup_ins + n_tup_upd + n_tup_del))::numeric(12, 5)
        ELSE -1
    END)                                                                                        AS updates_percentage,
    (CASE WHEN (n_tup_ins + n_tup_upd + n_tup_del) != 0
        THEN (n_tup_del::numeric / (n_tup_ins + n_tup_upd + n_tup_del))::numeric(12, 5)
        ELSE -1
    END)                                                                                        AS deletes_percentage,
    pg_relation_size(pg_stat_tables.relid)                                                      AS "tb_size_bytes",
    pg_size_pretty(pg_relation_size(pg_stat_tables.relid))                                      AS "tb_size"
FROM pg_indexes
JOIN pg_stat_user_indexes AS pg_stat_indexes ON (pg_indexes.indexname = pg_stat_indexes.indexrelname AND pg_indexes.schemaname = pg_stat_indexes.schemaname)
JOIN pg_stat_user_tables AS pg_stat_tables ON (pg_stat_tables.relid = pg_stat_indexes.relid)
WHERE 1 = 1
  AND pg_indexes.indexdef !~* 'unique'
ORDER BY idx_name DESC;
