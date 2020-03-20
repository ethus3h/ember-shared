packageNameFile=package-name
packageName=`cat $(packageNameFile)`
buildsystemDir=`cat support/.buildsystemdir`

all:
	@$(buildsystemDir)/support/prepare $(packageName) --override-data-dir=$(OVERRIDEDATADIR) $(DESTDIR) $(prefix) $(PREFIX) $(exec_prefix) $(bindir) $(datarootdir) $(datadir) $(sysconfdir) $(sharedstatedir)
	@echo "Done preparing" $(packageName)
install:
	@$(buildsystemDir)/support/install $(packageName) --override-data-dir=$(OVERRIDEDATADIR) $(DESTDIR) $(prefix) $(PREFIX) $(exec_prefix) $(bindir) $(datarootdir) $(datadir) $(sysconfdir) $(sharedstatedir)
	@echo "Done installing or updating" $(packageName)
noconf:
	@$(buildsystemDir)/support/install --skip-config-file $(packageName) --override-data-dir=$(OVERRIDEDATADIR) $(DESTDIR) $(prefix) $(PREFIX) $(exec_prefix) $(bindir) $(datarootdir) $(datadir) $(sysconfdir) $(sharedstatedir)
	@echo "Done installing or updating" $(packageName)
check:
	@$(buildsystemDir)/support/test $(packageName) --override-data-dir=$(OVERRIDEDATADIR) $(DESTDIR) $(prefix) $(PREFIX) $(exec_prefix) $(bindir) $(datarootdir) $(datadir) $(sysconfdir) $(sharedstatedir)
	@echo "Done running tests for" $(packageName)
autodep:
	@$(buildsystemDir)/support/autodep $(packageName) --override-data-dir=$(OVERRIDEDATADIR) $(DESTDIR) $(prefix) $(PREFIX) $(exec_prefix) $(bindir) $(datarootdir) $(datadir) $(sysconfdir) $(sharedstatedir)
	@echo "Done installing or updating dependencies for" $(packageName)

#### End of Makefile template ####

# Any extra Make rules go here.

