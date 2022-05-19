PHP_MAKEFILE = Makefile-php
COMMIT=develop

# TODO: while this is in a fork - let use a different repo name
REPO_PREFIX=scottaubrey/elifesciences-

# these targets will build the php versions for your current platform and store them in the local docker
# pushing isn't provided, as we want to push multi-arch manifests to the tags
build-php: build-php-7.1 build-php-7.3 build-php-7.4 build-php-8.0 build-php-8.1
build-php-7.1:
	@$(MAKE) -f $(PHP_MAKEFILE) REPO_PREFIX=$(REPO_PREFIX) PHP_VERSION=7.1 build
build-php-7.3:
	@$(MAKE) -f $(PHP_MAKEFILE) REPO_PREFIX=$(REPO_PREFIX) PHP_VERSION=7.3 build
build-php-7.4:
	@$(MAKE) -f $(PHP_MAKEFILE) REPO_PREFIX=$(REPO_PREFIX) PHP_VERSION=7.4 build
build-php-8.0:
	@$(MAKE) -f $(PHP_MAKEFILE) REPO_PREFIX=$(REPO_PREFIX) PHP_VERSION=8.0 build
build-php-8.1:
	@$(MAKE) -f $(PHP_MAKEFILE) REPO_PREFIX=$(REPO_PREFIX) PHP_VERSION=8.1 build

# run the baseline tests that the images run
test-php: test-php-7.1 test-php-7.3 test-php-7.4 test-php-8.0 test-php-8.1
test-php-7.1:
	@$(MAKE) -f $(PHP_MAKEFILE) REPO_PREFIX=$(REPO_PREFIX) PHP_VERSION=7.1 test
test-php-7.3:
	@$(MAKE) -f $(PHP_MAKEFILE) REPO_PREFIX=$(REPO_PREFIX) PHP_VERSION=7.3 test
test-php-7.4:
	@$(MAKE) -f $(PHP_MAKEFILE) REPO_PREFIX=$(REPO_PREFIX) PHP_VERSION=7.4 test
test-php-8.0:
	@$(MAKE) -f $(PHP_MAKEFILE) REPO_PREFIX=$(REPO_PREFIX) PHP_VERSION=8.0 test
test-php-8.1:
	@$(MAKE) -f $(PHP_MAKEFILE) REPO_PREFIX=$(REPO_PREFIX) PHP_VERSION=8.1 test

# build and test targets
build-and-test-php: build-and-test-php-7.1 build-and-test-php-7.3 build-and-test-php-7.4 build-and-test-php-8.0 build-and-test-php-8.1
build-and-test-php-7.1: build-php-7.1 test-php-7.1
build-and-test-php-7.3: build-php-7.3 test-php-7.3
build-and-test-php-7.4: build-php-7.4 test-php-7.4
build-and-test-php-8.0: build-php-8.0 test-php-8.0
build-and-test-php-8.1: build-php-8.1 test-php-8.1


# these targets utilise docker buildx to build multi-arch images,
# and push to docker hub (as local docker can't store multi-arch image manifest)
buildx-and-push-php: buildx-and-push-php-7.1 buildx-and-push-php-7.3 buildx-and-push-php-7.4 buildx-and-push-php-8.0 buildx-and-push-php-8.1
buildx-and-push-php-7.1:
	@$(MAKE) -f $(PHP_MAKEFILE) COMMIT=$(COMMIT) REPO_PREFIX=$(REPO_PREFIX) PHP_VERSION=7.1 buildx
buildx-and-push-php-7.3:
	@$(MAKE) -f $(PHP_MAKEFILE) COMMIT=$(COMMIT) REPO_PREFIX=$(REPO_PREFIX) PHP_VERSION=7.3 buildx
buildx-and-push-php-7.4:
	@$(MAKE) -f $(PHP_MAKEFILE) COMMIT=$(COMMIT) REPO_PREFIX=$(REPO_PREFIX) PHP_VERSION=7.4 buildx
buildx-and-push-php-8.0:
	@$(MAKE) -f $(PHP_MAKEFILE) COMMIT=$(COMMIT) REPO_PREFIX=$(REPO_PREFIX) PHP_VERSION=8.0 buildx
buildx-and-push-php-8.1:
	@$(MAKE) -f $(PHP_MAKEFILE) COMMIT=$(COMMIT) REPO_PREFIX=$(REPO_PREFIX) PHP_VERSION=8.1 buildx
