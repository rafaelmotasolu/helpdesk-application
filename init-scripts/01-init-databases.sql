-- ==============================================================================
-- HELPDESK APPLICATION - INITIALIZATION SCRIPT FOR POSTGRESQL
-- Cria os bancos de dados isolados para cada microsserviço
-- ==============================================================================

SELECT 'CREATE DATABASE user_db'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'user_db')\gexec

SELECT 'CREATE DATABASE ticket_db'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'ticket_db')\gexec

SELECT 'CREATE DATABASE notification_db'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'notification_db')\gexec

