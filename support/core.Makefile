# Based on https://stackoverflow.com/a/39895302 by igagis

#PREFIX is environment variable, but if it is not set, then set default value
ifeq ($(PREFIX),)
    PREFIX=`cat support/.prefix`
endif
ifeq ($(datadir),)
    datadir=`cat support/.datadir`
endif
ifeq ($(datadir),)
    datadir=`cat support/.datarootdir`
endif
ifeq ($(datadir),)
    datadir="/share"
endif

all:
	#@support/install-prepare-module
	@echo "Done preparing ember-shared-core"
install:
	@support/install-core
	@echo "Done installing or updating" ember-shared-core
