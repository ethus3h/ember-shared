# Based on https://stackoverflow.com/a/39895302 by igagis

#PREFIX is environment variable, but if it is not set, then set default value
ifeq ($(PREFIX),)
    PREFIX=`cat support/.prefix`
endif
ifeq ($(datadir),)
    datadir=`cat support/.datadir`
endif

all:
	@support/install-prepare-modules
	@echo "Done preparing ember-shared-core"
install:
	@install -d $(DESTDIR)$(PREFIX)/usr/bin/
	@install -m 755 scripts/ember_bash_setup_core $(DESTDIR)$(PREFIX)/usr/bin/
	@install -d $(DESTDIR)$(PREFIX)$(datadir)/ember/
	@find data -mindepth 1 -maxdepth 1 -exec cp -r {} $(DESTDIR)$(PREFIX)$(datadir)/ember/ \;
	@echo "Done installing or updating" ember-shared-core
