#!/bin/bash
set -e

useradd -ms /bin/bash -G www-data elife
chown elife:elife /srv
mkdir /srv/bin
chown elife:elife /srv/bin
mkdir -p /var/www
chown www-data:www-data /var/www
