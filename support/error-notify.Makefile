all:
	@echo "Done preparing ember-shared-error-notify"
install:
	@cp scripts/error-notify $(exec_prefix)/$(bindir)/
	@echo "Done installing or updating" $(packageName)
noconf:
	support/install --skip-config-file $(packageName) --override-data-dir=$(OVERRIDEDATADIR) $(DESTDIR) $(prefix) $(PREFIX) $(exec_prefix) $(bindir) $(datarootdir) $(datadir) $(sysconfdir) $(sharedstatedir)
	@echo "Done installing or updating" $(packageName)
check:
	@support/test $(packageName) --override-data-dir=$(OVERRIDEDATADIR) $(DESTDIR) $(prefix) $(PREFIX) $(exec_prefix) $(bindir) $(datarootdir) $(datadir) $(sysconfdir) $(sharedstatedir)
	@echo "Done running tests for" $(packageName)
autodep:
	@support/autodep $(packageName) --override-data-dir=$(OVERRIDEDATADIR) $(DESTDIR) $(prefix) $(PREFIX) $(exec_prefix) $(bindir) $(datarootdir) $(datadir) $(sysconfdir) $(sharedstatedir)
	@echo "Done installing or updating dependencies for" $(packageName)
