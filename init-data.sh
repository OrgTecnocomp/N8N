#!/bin/bash
set -e;


if [ -n "${DB_USER:-}" ] && [ -n "${DB_PASSWORD:-}" ]; then
	psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$DB_NAME" <<-EOSQL
		CREATE USER ${DB_USER} WITH PASSWORD '${DB_PASSWORD}';
		GRANT ALL PRIVILEGES ON DATABASE ${DB_NAME} TO ${DB_USER};
	EOSQL
else
	echo "SETUP INFO: No Environment variables given!"
fi