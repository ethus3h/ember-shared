packageNameFile=package-name
packageName=`cat $(packageNameFile)`

ifeq ($(PREFIX),)
    PREFIX=`cat support/.prefix`
endif
ifeq ($(datadir),)
    datadir=`cat support/.datadir`
endif
ifeq ($(datarootdir),)
    datarootdir=`cat support/.datarootdir`
endif

all:
	@support/prepare --package-name=$(packageName) --override-data-dir=$(OVERRIDEDATADIR) --destdir=$(DESTDIR) --prefix=$(prefix) --PREFIX=$(PREFIX) --exec_prefix=$(exec_prefix) --bindir=$(bindir) --datarootdir=$(datarootdir) --datadir=$(datadir) --sysconfdir=$(sysconfdir) --sharedstatedir=$(sharedstatedir)
	@echo "Done preparing" $(packageName)
install:
	@support/install --package-name=$(packageName) --override-data-dir=$(OVERRIDEDATADIR) --destdir=$(DESTDIR) --prefix=$(prefix) --PREFIX=$(PREFIX) --exec_prefix=$(exec_prefix) --bindir=$(bindir) --datarootdir=$(datarootdir) --datadir=$(datadir) --sysconfdir=$(sysconfdir) --sharedstatedir=$(sharedstatedir)
	@echo "Done installing or updating" $(packageName)
noconf:
	@support/install --skip-config-file --package-name=$(packageName) --override-data-dir=$(OVERRIDEDATADIR) --destdir=$(DESTDIR) --prefix=$(prefix) --PREFIX=$(PREFIX) --exec_prefix=$(exec_prefix) --bindir=$(bindir) --datarootdir=$(datarootdir) --datadir=$(datadir) --sysconfdir=$(sysconfdir) --sharedstatedir=$(sharedstatedir)
	@echo "Done installing or updating" $(packageName)
check:
	@support/test --package-name=$(packageName) --override-data-dir=$(OVERRIDEDATADIR) --destdir=$(DESTDIR) --prefix=$(prefix) --PREFIX=$(PREFIX) --exec_prefix=$(exec_prefix) --bindir=$(bindir) --datarootdir=$(datarootdir) --datadir=$(datadir) --sysconfdir=$(sysconfdir) --sharedstatedir=$(sharedstatedir)
	@echo "Done running tests for" $(packageName)
autodep:
	@support/autodep --package-name=$(packageName) --override-data-dir=$(OVERRIDEDATADIR) --destdir=$(DESTDIR) --prefix=$(prefix) --PREFIX=$(PREFIX) --exec_prefix=$(exec_prefix) --bindir=$(bindir) --datarootdir=$(datarootdir) --datadir=$(datadir) --sysconfdir=$(sysconfdir) --sharedstatedir=$(sharedstatedir)
	@echo "Done installing or updating dependencies for" $(packageName)
