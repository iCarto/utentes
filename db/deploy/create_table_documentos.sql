-- Deploy utentes:create_table_documentos to pg

BEGIN;

CREATE TABLE utentes.documentos (
	"gid" serial PRIMARY KEY,
	"name" text NOT NULL,
	"departamento" text NOT NULL,
	"size" integer,
	"saved" boolean NOT NULL DEFAULT FALSE,
	"exploracao" integer NOT NULL REFERENCES utentes.exploracaos(gid),
    "user" varchar(128) NOT NULL REFERENCES utentes.users(username),
    "created_at" timestamp NOT NULL DEFAULT now()
);

COMMIT;
