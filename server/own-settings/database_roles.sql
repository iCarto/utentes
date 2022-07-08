--
-- PostgreSQL database cluster dump
--

\connect postgres

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE sirha_base_user;
ALTER ROLE sirha_base_user WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE tecnico;
ALTER ROLE tecnico WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
ALTER ROLE tecnico WITH PASSWORD 'tecnico';
GRANT sirha_base_user TO tecnico GRANTED BY postgres;

CREATE ROLE integrations_role WITH NOSUPERUSER NOCREATEDB NOCREATEROLE NOINHERIT NOLOGIN NOREPLICATION;

CREATE USER revubue WITH
       NOSUPERUSER NOCREATEDB NOCREATEROLE NOREPLICATION NOBYPASSRLS
       INHERIT
       LOGIN
       PASSWORD NULL
       CONNECTION LIMIT 1
       IN ROLE integrations_role
;
