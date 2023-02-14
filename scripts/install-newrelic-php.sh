#!/bin/bash
set -e

echo 'deb http://apt.newrelic.com/debian/ newrelic non-free' > /etc/apt/sources.list.d/newrelic.list
curl https://download.newrelic.com/548C16BF.gpg | apt-key add -

# regarding 'newrelic-php5', package supports both PHP 5 and PHP 7:
# - https://docs.newrelic.com/docs/apm/agents/php-agent/installation/php-agent-installation-ubuntu-debian/#php7
apt-get update && apt-get install --no-install-recommends -y newrelic-php5

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
