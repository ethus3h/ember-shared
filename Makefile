packageName = example-package-name

all:
	@support/prepare $(packageName) $(DESTDIR) $(prefix) $(PREFIX) $(exec_prefix) $(bindir) $(datarootdir) $(datadir) $(sysconfdir) $(sharedstatedir)
	@echo "Done preparing the package"
install:
	@support/install $(packageName) --override-data-dir=$(OVERRIDEDATADIR) $(DESTDIR) $(prefix) $(PREFIX) $(exec_prefix) $(bindir) $(datarootdir) $(datadir) $(sysconfdir) $(sharedstatedir)
	@echo "Done installing or updating eite"
noconf:
	support/install $(packageName) --skip-config-file --override-data-dir=$(OVERRIDEDATADIR) $(DESTDIR) $(prefix) $(PREFIX) $(exec_prefix) $(bindir) $(datarootdir) $(datadir) $(sysconfdir) $(sharedstatedir)
	@echo "Done installing or updating eite"
autodep:
	@support/autodep $(packageName) $(DESTDIR) $(prefix) $(PREFIX) $(exec_prefix) $(bindir) $(datarootdir) $(datadir) $(sysconfdir) $(sharedstatedir)
	@echo "Done installing or updating dependencies"
test:
	@support/test $(packageName)
	@echo "Done running tests"
