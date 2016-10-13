#!/bin/bash -ex

POSTGRESQL_HOST=${POSTGRESQL_HOST:-"postgresql"}
POSTGRESQL_PORT=${POSTGRESQL_PORT:-"postgresql"}
POSTGRESQL_DB=${POSTGRESQL_DB:-"puppetdb"}
POSTGRESQL_USER=${POSTGRESQL_USER:-"puppetdb"}
POSTGRESQL_PASSWORD=${POSTGRESQL_PASSWORD:-"puppetdb"}

# TODO: USE AUGEAS
sed -i -e 's/^classname = .*/classname = org.postgresql.Driver/' /etc/puppetlabs/puppetdb/conf.d/database.ini
sed -i -e 's/^subprotocol = .*/subprotocol = postgresql/' /etc/puppetlabs/puppetdb/conf.d/database.ini
sed -i -E 's@^(#\s*)subname = .*@subname = //${POSTGRESQL_HOST}:${POSTGRESQL_POST}/${POSTGRESQL_DB}@' /etc/puppetlabs/puppetdb/conf.d/database.ini
sed -i -E 's@^(#\s*)username = .*@username = ${POSTGRESQL_USER}@' /etc/puppetlabs/puppetdb/conf.d/database.ini
sed -i -E 's@^(#\s*)password = .*@password = ${POSTGRESQL_PASSWORD}@' /etc/puppetlabs/puppetdb/conf.d/database.ini
