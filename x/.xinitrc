# Fix Java GUI's
wmname LG3D

# Load Xresources
xrdb -load .Xresources

# Setup monitors, sound, network, input, etc.
./.scripts/setup.sh

# Window manager
exec ratpoison

# vim:fdm=marker
