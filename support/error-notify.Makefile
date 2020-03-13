all:
	@echo "Done preparing ember-shared-error-notify"
install:
	@cp scripts/error-notify $(exec_prefix)/$(bindir)/
	@echo "Done installing or updating" ember-shared-error-notify
