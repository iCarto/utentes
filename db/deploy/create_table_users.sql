-- Deploy utentes:create_table_users to pg

BEGIN;

CREATE TABLE domains.groups (
    category TEXT NOT NULL default 'groups',
    key TEXT UNIQUE,
    value TEXT,
    ordering INTEGER,
    parent TEXT,
    tooltip TEXT
);

INSERT INTO domains.groups (key, ordering) VALUES
(null, 0),
('Administrador', 1),
('D. Administrativo', 2),
('Direcção', 3),
('D. Financeiro', 4),
('D. Jurídico', 5),
('D. Técnico', 6);


create table utentes.users(
    id SERIAL PRIMARY KEY,
	username varchar(128) UNIQUE,
	password varchar(254),
    screen_name TEXT,
    usergroup TEXT REFERENCES domains.groups(key),
    last_login timestamp without time zone,
    new_login timestamp without time zone not null default now(),
    created_at timestamp without time zone NOT NULL default now()
);

COMMIT;
