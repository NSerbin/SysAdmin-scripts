#!/bin/bash

HOST=$1
USER=$2
DB=$3
NEW_DB=$4
DUMP_DB=$5

function drop_database(){
    psql -h "$HOST" -U "$USER" -d "$DB" -W -c "DROP DATABASE $NEW_DB;"
}

function create_database(){
    psql -h "$HOST" -U "$USER" -d "$DB" -W -c "CREATE DATABASE $NEW_DB;"
}

function dump_database(){
    pg_dump -h "$HOST" -U "$USER" -F p -b -v -f "$DUMP_DB".dump "$DB";
}

function connect_database(){
    psql -h "$HOST" -U "$USER" -d "$DB" -W;
}