# Based on https://stackoverflow.com/a/39895302 by igagis

#PREFIX is environment variable, but if it is not set, then set default value
ifeq ($(PREFIX),)
    #PREFIX := /usr/local
    PREFIX=`cat support/.prefix`
    #PWD=`pwd`
    #CONTENTS=`ls`
endif

all:
	#@echo $(PWD)
	#@echo $(CONTENTS)
	@support/install-prepare-modules
	@echo "Done preparing ember-shared-error-notify"
install:
	@install -d $(DESTDIR)$(PREFIX)/usr/bin/
	@install -m 755 scripts/error-notify $(DESTDIR)$(PREFIX)/usr/bin/
	@echo "Done installing or updating" ember-shared-error-notify
