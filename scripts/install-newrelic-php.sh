#!/bin/bash
set -e

echo 'deb http://apt.newrelic.com/debian/ newrelic non-free' > /etc/apt/sources.list.d/newrelic.list
curl https://download.newrelic.com/548C16BF.gpg | apt-key add -

# the package contains both PHP 5 and PHP 7 support
# https://discuss.newrelic.com/t/php-agent-and-php-7-0/27687/85
apt-get update && apt-get install -y newrelic-php5

NR_INSTALL_SILENT="set-any-value-to-enable" \
newrelic-install install

# adapted from https://discuss.newrelic.com/t/php-agent-configuration-in-docker-containers/41499/3
sed -i \
 -e "s/;\?newrelic.enabled =.*/newrelic.enabled = \${NEW_RELIC_ENABLED}/" \
 -e "s/;\?newrelic.license =.*/newrelic.license = \${NEW_RELIC_LICENSE_KEY}/" \
 -e "s/;\?newrelic.appname =.*/newrelic.appname = \${NEW_RELIC_APP_NAME}/" \
 -e "s/;\?newrelic.labels =.*/newrelic.labels = \"project:\${NEW_RELIC_APP_NAME};env:\${ENVIRONMENT_NAME}\"/" \
${PHP_INI_DIR}/conf.d/newrelic.ini

rm -rf /var/lib/apt/lists/*
rm /tmp/nrinstall-*
