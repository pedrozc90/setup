SELECT
    c.table_schema                  AS "schema_name",
    c.table_name,
    c.constraint_name,
    c.constraint_type
FROM information_schema.table_constraints c
WHERE 1 = 1
  AND c.constraint_type ~* 'primary'        -- primary keys
--   AND c.constraint_type ~* 'foreign'        -- foreign keys
--   AND c.constraint_type ~* 'unique'         -- unique constraints
--   AND c.table_name ~* 'bank'
ORDER BY c.constraint_name;
