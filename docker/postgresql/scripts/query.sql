DROP TABLE IF EXISTS accounts;
DROP SEQUENCE IF EXISTS accounts_id_seq;

CREATE SEQUENCE IF NOT EXISTS accounts_id_seq
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    START WITH 1
    CACHE 1;

CREATE TABLE IF NOT EXISTS accounts (
    -- id BIGINT DEFAULT nextval('accounts_id_seq'),
    name text,
    url text,
    username text,
    password text
    -- CONSTRAINT accounts_pkey PRIMARY KEY (id)
);

COPY accounts FROM '/home/chrome_passwords.csv' csv header;
