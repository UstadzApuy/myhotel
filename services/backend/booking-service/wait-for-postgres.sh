# services/backend/all backend services/wait-for-postgres.sh
#!/bin/sh
set -e

host="${PGHOST:-$DB_HOST}"
until PGPASSWORD=$PGPASSWORD psql -h "$host" -U "$PGUSER" -d "$PGDATABASE" -c '\q' 2>/dev/null; do
  echo "⏳ Waiting for Postgres at $host..."
  sleep 2
done

echo "✅ Postgres is up - starting app"
exec "$@"