#!/usr/bin/env bash

# Signal trapping.

handle_term()
{
   echo "Signal received, create-senzing-schema.sh exiting."
   exit 0
}

trap 'handle_term' TERM

# =============================================================================
# Main
# =============================================================================

# Perform Db2 database operations as "db2inst1" user.

su - db2inst1 -c "
  db2start;
  db2 create database g2 using codeset utf-8 territory us;
  db2 connect to g2;
  db2 -tf /opt/senzing/g2/resources/schema/g2core-schema-db2-create.sql;
  db2 connect reset;
"

# Sleep in a manner that allows "docker stop ..." to shutdown gracefully.

echo "/app/create-senzing-schema.sh is sleeping infinitely."
sleep infinity &
wait
