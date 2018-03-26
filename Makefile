
DESTDIR =
LOCATION = /usr/lib
FLAVOR = lirc

install:
	@echo "Installing hwdb file to $(LOCATION)..."
	@install -Dm644 $(FLAVOR).hwdb $(DESTDIR)$(LOCATION)/udev/hwdb.d/90-remap-technisat-ir-receiver.hwdb
ifeq ($(strip $(DESTDIR)),)
	@echo "Updating the hwdb database..."
	@systemd-hwdb update
else
	@echo "Not updating hwdb database, because a destination directory is specified."
	@echo "Do not forget to call 'systemd-hwdb update' after installation"
endif	

install-local: LOCATION=/etc
install-local: install
