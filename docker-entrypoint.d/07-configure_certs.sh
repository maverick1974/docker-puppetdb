#!/bin/bash -ex

# Things done by "puppetdb ssl-setup -f" at first run
sed -i -E 's@^(#\s*)ssl-host = .*@ssl-host = 0.0.0.0@' /etc/puppetlabs/puppetdb/conf.d/jetty.ini
sed -i -E 's@^(#\s*)ssl-port = .*@ssl-port = 8081@' /etc/puppetlabs/puppetdb/conf.d/jetty.ini
sed -i -E 's@^(#\s*)ssl-key = .*@ssl-key = /etc/puppetlabs/puppetdb/ssl/private.pem@' /etc/puppetlabs/puppetdb/conf.d/jetty.ini
sed -i -E 's@^(#\s*)ssl-cert = .*@ssl-cert = /etc/puppetlabs/puppetdb/ssl/public.pem@' /etc/puppetlabs/puppetdb/conf.d/jetty.ini
sed -i -E 's@^(#\s*)ssl-ca-cert = .*@ssl-ca-cert = /etc/puppetlabs/puppetdb/ssl/ca.pem@' /etc/puppetlabs/puppetdb/conf.d/jetty.ini
