packageNameFile=package-name
packageName=`cat $(packageNameFile)`

all:
	@support/prepare $(packageName) --override-data-dir=$(OVERRIDEDATADIR) --destdir=$(DESTDIR) --prefix=$(prefix) --PREFIX=$(PREFIX) --exec_prefix=$(exec_prefix) --bindir=$(bindir) --datarootdir=$(datarootdir) --datadir=$(datadir) --sysconfdir=$(sysconfdir) --sharedstatedir=$(sharedstatedir)
	@echo "Done preparing" $(packageName)
install:
	@support/install --package-name=$(packageName) --override-data-dir=$(OVERRIDEDATADIR) --destdir=$(DESTDIR) --prefix=$(prefix) --PREFIX=$(PREFIX) --exec_prefix=$(exec_prefix) --bindir=$(bindir) --datarootdir=$(datarootdir) --datadir=$(datadir) --sysconfdir=$(sysconfdir) --sharedstatedir=$(sharedstatedir)
	@echo "Done installing or updating" $(packageName)
noconf:
	support/install --skip-config-file $(packageName) --override-data-dir=$(OVERRIDEDATADIR) --destdir=$(DESTDIR) --prefix=$(prefix) --PREFIX=$(PREFIX) --exec_prefix=$(exec_prefix) --bindir=$(bindir) --datarootdir=$(datarootdir) --datadir=$(datadir) --sysconfdir=$(sysconfdir) --sharedstatedir=$(sharedstatedir)
	@echo "Done installing or updating" $(packageName)
check:
	@support/test $(packageName) --override-data-dir=$(OVERRIDEDATADIR) --destdir=$(DESTDIR) --prefix=$(prefix) --PREFIX=$(PREFIX) --exec_prefix=$(exec_prefix) --bindir=$(bindir) --datarootdir=$(datarootdir) --datadir=$(datadir) --sysconfdir=$(sysconfdir) --sharedstatedir=$(sharedstatedir)
	@echo "Done running tests for" $(packageName)
autodep:
	@support/autodep $(packageName) --override-data-dir=$(OVERRIDEDATADIR) --destdir=$(DESTDIR) --prefix=$(prefix) --PREFIX=$(PREFIX) --exec_prefix=$(exec_prefix) --bindir=$(bindir) --datarootdir=$(datarootdir) --datadir=$(datadir) --sysconfdir=$(sysconfdir) --sharedstatedir=$(sharedstatedir)
	@echo "Done installing or updating dependencies for" $(packageName)
