# Base images for eLife containers

## Available images

- ~[`php_7.0_cli`](https://hub.docker.com/r/elifesciences/php_7.0_cli/)~
- ~[`php_7.0_fpm`](https://hub.docker.com/r/elifesciences/php_7.0_fpm/)~
- [`php_7.1_cli`](https://hub.docker.com/r/elifesciences/php_7.1_cli/)
- [`php_7.1_fpm`](https://hub.docker.com/r/elifesciences/php_7.1_fpm/)
- [`php_7.3_cli`](https://hub.docker.com/r/elifesciences/php_7.3_cli/)
- [`php_7.3_fpm`](https://hub.docker.com/r/elifesciences/php_7.3_fpm/)
- [`python_3.6`](https://hub.docker.com/r/elifesciences/python_3.6/)

## Unified PHP image

- [unified docker PHP image repository (with tags for `7.4-cli`, `7.4-fpm`, `8.0-cli` and `8.0-fpm)`](https://hub.docker.com/r/scottaubrey/elifesciences-php/tags)

NOTE: there is no `latest` tag - instead, specify the tag you desire, e.g. `docker pull scottaubrey/elifesciences-php:7.4-cli`


## Available helper images

- [`python_3.6_pipenv`](https://hub.docker.com/r/elifesciences/python_3.6_pipenv/)

## Deprecated images

- [`php_cli`](https://hub.docker.com/r/elifesciences/php_cli/)
- [`php_fpm`](https://hub.docker.com/r/elifesciences/php_fpm/)
- [`python`](https://hub.docker.com/r/elifesciences/python/)

## Basic infrastructure

- Every image has an `elife` user that should own files
- Every image has a `www-data` user that should run all processes
- Images are tested for sanity, e.g. the PHP interpreter runs without issues.
