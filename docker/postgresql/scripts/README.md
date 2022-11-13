# PostgreSQL

```sql
CREATE SEQUENCE IF NOT EXISTS my_table_id_seq AS bigint 
    INCREMENT BY 1
    MINVALUE 1
    CACHE 1
    NO CYCLE
    OWNED BY postgres;
```
