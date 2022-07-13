# Base images for eLife containers

## Available images

- [`php_7.3_cli`](https://hub.docker.com/r/elifesciences/php_7.3_cli/)
- [`php_7.3_fpm`](https://hub.docker.com/r/elifesciences/php_7.3_fpm/)
- [`python_3.8`](https://hub.docker.com/r/elifesciences/python_3.8/)

## Deprecated images

Do not use, still maintained and built.

- [`php_7.1_cli`](https://hub.docker.com/r/elifesciences/php_7.1_cli/)
- [`php_7.1_fpm`](https://hub.docker.com/r/elifesciences/php_7.1_fpm/)
- [`python`](https://hub.docker.com/r/elifesciences/python/)
- [`python_3.6_pipenv`](https://hub.docker.com/r/elifesciences/python_3.6_pipenv/)

## Obsolete images

Do not use, no longer maintained or built.

- [`php_cli`](https://hub.docker.com/r/elifesciences/php_cli/)
- [`php_fpm`](https://hub.docker.com/r/elifesciences/php_fpm/)
- [`php_7.0_cli`](https://hub.docker.com/r/elifesciences/php_7.0_cli/)
- [`php_7.0_fpm`](https://hub.docker.com/r/elifesciences/php_7.0_fpm/)

## Basic infrastructure

- Every image has an `elife` user that should own files
- Every image has a `www-data` user that should run all processes
- Images are tested for sanity, e.g. the PHP interpreter runs without issues.

