packageNameFile=package-name
packageName=`cat $(packageNameFile)`
buildsystemDir=`cat support/.buildsystemdir`

all:
	@$(buildsystemDir)/support/prepare --package-name=$(packageName) --override-data-dir=$(OVERRIDEDATADIR) --destdir=$(DESTDIR) --prefix=$(prefix) --PREFIX=$(PREFIX) --exec_prefix=$(exec_prefix) --bindir=$(bindir) --datarootdir=$(datarootdir) --datadir=$(datadir) --sysconfdir=$(sysconfdir) --sharedstatedir=$(sharedstatedir)
	@echo "Done preparing" $(packageName)
install:
	@$(buildsystemDir)/support/install --package-name=$(packageName) --override-data-dir=$(OVERRIDEDATADIR) --destdir=$(DESTDIR) --prefix=$(prefix) --PREFIX=$(PREFIX) --exec_prefix=$(exec_prefix) --bindir=$(bindir) --datarootdir=$(datarootdir) --datadir=$(datadir) --sysconfdir=$(sysconfdir) --sharedstatedir=$(sharedstatedir)
	@echo "Done installing or updating" $(packageName)
noconf:
	@$(buildsystemDir)/support/install --skip-config-file --package-name=$(packageName) --override-data-dir=$(OVERRIDEDATADIR) --destdir=$(DESTDIR) --prefix=$(prefix) --PREFIX=$(PREFIX) --exec_prefix=$(exec_prefix) --bindir=$(bindir) --datarootdir=$(datarootdir) --datadir=$(datadir) --sysconfdir=$(sysconfdir) --sharedstatedir=$(sharedstatedir)
	@echo "Done installing or updating" $(packageName)
check:
	@$(buildsystemDir)/support/test --package-name=$(packageName) --override-data-dir=$(OVERRIDEDATADIR) --destdir=$(DESTDIR) --prefix=$(prefix) --PREFIX=$(PREFIX) --exec_prefix=$(exec_prefix) --bindir=$(bindir) --datarootdir=$(datarootdir) --datadir=$(datadir) --sysconfdir=$(sysconfdir) --sharedstatedir=$(sharedstatedir)
	@echo "Done running tests for" $(packageName)
autodep:
	@$(buildsystemDir)/support/autodep --package-name=$(packageName) --override-data-dir=$(OVERRIDEDATADIR) --destdir=$(DESTDIR) --prefix=$(prefix) --PREFIX=$(PREFIX) --exec_prefix=$(exec_prefix) --bindir=$(bindir) --datarootdir=$(datarootdir) --datadir=$(datadir) --sysconfdir=$(sysconfdir) --sharedstatedir=$(sharedstatedir)
	@echo "Done installing or updating dependencies for" $(packageName)

#### End of Makefile template ####

