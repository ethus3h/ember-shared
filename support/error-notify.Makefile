#PREFIX is environment variable, but if it is not set, then set default value
ifeq ($(PREFIX),)
    PREFIX := /usr/local
    PREFIX=`cat support/.prefix`
endif

all:
	@echo "Done preparing ember-shared-error-notify"
install:
	@install -d $(DESTDIR)$(PREFIX)/usr/bin/
	@install -m 755 scripts/error-notify $(DESTDIR)$(PREFIX)/usr/bin/
	@echo "Done installing or updating" ember-shared-error-notify
