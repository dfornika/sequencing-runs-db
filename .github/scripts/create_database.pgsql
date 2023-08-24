update pg_database set datallowconn = false where datname = 'sequencing_runs';
select pg_terminate_backend(pid) from pg_stat_activity where datname = 'sequencing_runs' and pid <> pg_backend_pid();
DROP DATABASE IF EXISTS sequencing_runs;
CREATE DATABASE sequencing_runs;
DO
$do$
BEGIN
   IF EXISTS (
      SELECT FROM pg_catalog.pg_roles
      WHERE  rolname = 'sequencing_runs_test_user') THEN

      DROP ROLE sequencing_runs_test_user;
   END IF;
END
$do$;
CREATE ROLE sequencing_runs_test_user LOGIN PASSWORD 'sequencingrunstestpassword';
GRANT ALL PRIVILEGES ON DATABASE sequencing_runs TO sequencing_runs_test_user;
\c sequencing_runs
GRANT ALL ON SCHEMA public TO sequencing_runs_test_user;
