#!/bin/bash -ex

# Allow JAVA_ARGS tuning
JAVA_ARGS=${JAVA_ARGS:-1}

sed -i -e 's@^JAVA_ARGS=\(.*\)$@JAVA_ARGS=${JAVA_ARGS}@' /etc/default/puppetdb
