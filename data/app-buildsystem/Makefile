packageNameFile=package-name
packageName=`cat $(packageNameFile)`
buildsystemDir=`cat support/.buildsystemdir`

all:
	@$(buildsystemDir)/support/prepare $(packageName) --override-data-dir=$(OVERRIDEDATADIR) --destdir=$(DESTDIR) --prefix=$(prefix) --PREFIX=$(PREFIX) --exec_prefix=$(exec_prefix) --bindir=$(bindir) --datarootdir=$(datarootdir) --datadir=$(datadir) --sysconfdir=$(sysconfdir) --sharedstatedir=$(sharedstatedir)
	@echo "Done preparing" $(packageName)
install:
	@$(buildsystemDir)/support/install $(packageName) --override-data-dir=$(OVERRIDEDATADIR) --destdir=$(DESTDIR) --prefix=$(prefix) --PREFIX=$(PREFIX) --exec_prefix=$(exec_prefix) --bindir=$(bindir) --datarootdir=$(datarootdir) --datadir=$(datadir) --sysconfdir=$(sysconfdir) --sharedstatedir=$(sharedstatedir)
	@echo "Done installing or updating" $(packageName)
noconf:
	@$(buildsystemDir)/support/install --skip-config-file $(packageName) --override-data-dir=$(OVERRIDEDATADIR) --destdir=$(DESTDIR) --prefix=$(prefix) --PREFIX=$(PREFIX) --exec_prefix=$(exec_prefix) --bindir=$(bindir) --datarootdir=$(datarootdir) --datadir=$(datadir) --sysconfdir=$(sysconfdir) --sharedstatedir=$(sharedstatedir)
	@echo "Done installing or updating" $(packageName)
check:
	@$(buildsystemDir)/support/test $(packageName) --override-data-dir=$(OVERRIDEDATADIR) --destdir=$(DESTDIR) --prefix=$(prefix) --PREFIX=$(PREFIX) --exec_prefix=$(exec_prefix) --bindir=$(bindir) --datarootdir=$(datarootdir) --datadir=$(datadir) --sysconfdir=$(sysconfdir) --sharedstatedir=$(sharedstatedir)
	@echo "Done running tests for" $(packageName)
autodep:
	@$(buildsystemDir)/support/autodep $(packageName) --override-data-dir=$(OVERRIDEDATADIR) --destdir=$(DESTDIR) --prefix=$(prefix) --PREFIX=$(PREFIX) --exec_prefix=$(exec_prefix) --bindir=$(bindir) --datarootdir=$(datarootdir) --datadir=$(datadir) --sysconfdir=$(sysconfdir) --sharedstatedir=$(sharedstatedir)
	@echo "Done installing or updating dependencies for" $(packageName)

#### End of Makefile template ####

