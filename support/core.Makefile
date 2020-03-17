# Based on https://stackoverflow.com/a/39895302 by igagis

#PREFIX is environment variable, but if it is not set, then set default value
ifeq ($(PREFIX),)
    PREFIX=`cat support/.prefix`
endif

all:
	@support/install-prepare-modules
	@echo "Done preparing ember-shared-core"
install:
	@install -d $(DESTDIR)$(PREFIX)/usr/bin/
	@install -m 755 scripts/ember_bash_setup_core $(DESTDIR)$(PREFIX)/usr/bin/
	@cp -r data/ $(DESTDIR)$(PREFIX)$(datadir)/ember/
	@echo "Done installing or updating" ember-shared-core
