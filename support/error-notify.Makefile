#PREFIX is environment variable, but if it is not set, then set default value
ifeq ($(PREFIX),)
    PREFIX := /usr/local
endif
all:
	@echo "Done preparing ember-shared-error-notify"
install:
	@install -d scripts/error-notify $(DESTDIR)$(PREFIX)/usr/bin/
	@echo "Done installing or updating" ember-shared-error-notify
