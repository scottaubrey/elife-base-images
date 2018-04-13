# Base images for eLife containers

## Available images

- `php_7.0_cli`
- `php_7.0_fpm`

## Basic infrastructure

- Every image has an `elife` user that should own files
- Every image has a `www-data` user that should run all processes
- Images are tested for sanity, e.g. the PHP interpreter runs without issues.

