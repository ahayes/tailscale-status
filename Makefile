
# Run this in a terminal window to see the logs from the extensions and if on X11 
# hit F2 and type "r" to restart gnome-shell to apply any changes.
debug:
	journalctl -f -o cat /usr/bin/gnome-shell

# Development in wayland is a bit nicer, this opens a separate gnome session
test-wayland:
	env GNOME_SHELL_SLOWDOWN_FACTOR=2 MUTTER_DEBUG_DUMMY_MODE_SPECS=1920x1080 dbus-run-session -- gnome-shell --nested --wayland

# Use this command to temporary install the extension. Note, it might be easier to rename
# it since I've experienced some kind of caching or automated upgrading which would update 
# the extension to the latest version.
link:
	cd $$HOME/oss/tailscale-status/tailscale-status@maxgallup.github.com && glib-compile-schemas schemas/
	ln -s $$HOME/oss/tailscale-status/tailscale-status@maxgallup.github.com $$HOME/.local/share/gnome-shell/extensions/tailscale-status@maxgallup.github.com

# Resulting zip used to submit to gnome extensions
zip:
	cd tailscale-status@maxgallup.github.com && zip -r ../tailscale-status@maxgallup.github.com.zip *

clean:
	rm tailscale-status@maxgallup.github.com.zip
