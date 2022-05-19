#!/bin/bash
set -e

if [ "$(uname -m)" == "aarch64" ]; then
#build from source
apt-get update && apt-get install --no-install-recommends -y libpcre3-dev golang-go sudo automake libtool-bin autotools-dev git build-essential
# build from source on ARM - instructions here: https://docs.newrelic.com/docs/apm/agents/php-agent/installation/php-agent-installation-arm64/
git clone https://github.com/newrelic/newrelic-php-agent.git /tmp/nrsrc
cd /tmp/nrsrc
# git checkout v9.18.1.303
git checkout main # (always latest release, like the repo install below)
make all
sudo make agent-install
cp agent/scripts/newrelic.ini.template ${PHP_INI_DIR}/conf.d/newrelic.ini
make daemon
cp bin/daemon /usr/bin/newrelic-daemon
cp bin/client /usr/bin/newrelic-client
cp bin/stressor /usr/bin/newrelic-stressor
cp bin/integration_runner /usr/bin/newrelic-integration_runner

mkdir /var/log/newrelic
chown www-data:www-data /var/log/newrelic

rm -Rf /tmp/nrsrc
SUDO_FORCE_REMOVE=yes apt-get -y autoremove golang-go sudo automake libtool-bin autotools-dev git build-essential
else

# assume a supported platform in NR's repo
echo 'deb http://apt.newrelic.com/debian/ newrelic non-free' > /etc/apt/sources.list.d/newrelic.list
curl https://download.newrelic.com/548C16BF.gpg | apt-key add -
# the package contains both PHP 5 and PHP 7 support
# https://discuss.newrelic.com/t/php-agent-and-php-7-0/27687/85
apt-get update && apt-get install --no-install-recommends -y newrelic-php5

NR_INSTALL_SILENT="set-any-value-to-enable" \
newrelic-install install
rm /tmp/nrinstall-*
fi

# adapted from https://discuss.newrelic.com/t/php-agent-configuration-in-docker-containers/41499/3
sed -i \
 -e "s/;\?newrelic.enabled =.*/newrelic.enabled = \${NEW_RELIC_ENABLED}/" \
 -e "s/;\?newrelic.license =.*/newrelic.license = \${NEW_RELIC_LICENSE_KEY}/" \
 -e "s/;\?newrelic.appname =.*/newrelic.appname = \${NEW_RELIC_APP_NAME}/" \
 -e "s/;\?newrelic.labels =.*/newrelic.labels = \"project:\${NEW_RELIC_APP_NAME};env:\${ENVIRONMENT_NAME}\"/" \
${PHP_INI_DIR}/conf.d/newrelic.ini

rm -rf /var/lib/apt/lists/*
