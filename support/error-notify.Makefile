all:
	@echo "Done preparing ember-shared-error-notify"
install:
	@cp scripts/error-notify $(DESTDIR)$(PREFIX)/usr/bin/
	@echo "Done installing or updating" ember-shared-error-notify
