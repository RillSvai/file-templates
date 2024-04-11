#!/usr/bin/env bash
set -eo pipefail
set -x
 
if ! [ -x "$(command -v sqlx)" ]; then
    echo >&2 "Error: sqlx is not installed."
    echo >&2 "Use:"
    echo >&2 "  cargo install sqlx-cli --no-default-features --features postgres"
    echo >&2 "to install it."
    exit 1
fi

DB_USER="${POSTGRES_USER:=dev}"
DB_PASSWORD="${POSTGRES_PASSWORD:=password}"
DB_NAME="${POSTGRES_DB:=email_newsletter}"
DB_PORT="${POSTGRES_PORT:=5432}"

if [[ -z "${SKIP_DOCKER}" ]]; then

    RUNNING_POSTGRES_CONTAINERS=$(docker ps --filter 'name=postgres' --format '{{.ID}}')
    
    if [[ -n $RUNNING_POSTGRES_CONTAINERS ]]; then
        echo >&2 "There are postgres container(s) already running, kill and remove it with:"
        FORMATTED_CONTAINERS=$(echo $RUNNING_POSTGRES_CONTAINERS | tr '\n' ' \\' | sed 's/\\$//')
        echo >&2 "  docker rm -f $FORMATTED_CONTAINERS"
        exit 1
    fi

    docker run \
    -e POSTGRES_USER=${DB_USER} \
    -e POSTGRES_PASSWORD=${DB_PASSWORD} \
    -e POSTGRES_DB=${DB_NAME} \
    -p ${DB_PORT}:5432 \
    --name "email_newsletter_postgres" \
    -d postgres \
    postgres -N 1000
fi

>&2 echo "Postgres is up and running on port ${DB_PORT} - running migrations now!"

export DATABASE_URL="postgres://${DB_USER}:${DB_PASSWORD}@localhost:${DB_PORT}/${DB_NAME}"
sqlx database create
sqlx migrate run

>&2 echo "Postgres has been migrated, ready to go!"