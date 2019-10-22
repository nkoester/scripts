#!/bin/bash
# due to a bug in bluetooth/pulse, the WX-1000-M3 connect with the wrong
# profile. calling this directly makes it work. sigh.

# https://bugs.launchpad.net/ubuntu/+source/pulseaudio/+bug/508522
# https://gitlab.freedesktop.org/pulseaudio/pulseaudio/issues/81
# https://bugs.launchpad.net/ubuntu/+source/bluez/+bug/1438510


# power device on if turned off
bluetoothctl power on

# kill all existing connection tries in case they hang
pkill -f "bluetoothctl connect CC:98:8B:80:F8:E4"

# sanity disconnect
bluetoothctl disconnect CC:98:8B:80:F8:E4

# actual connect command that magically works...
bluetoothctl connect CC:98:8B:80:F8:E4
