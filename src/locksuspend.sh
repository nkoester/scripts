#!/bin/bash

echo "Locking screen ..."
/usr/bin/xscreensaver-command -lock
sleep 1

echo "Suspending ..."
systemctl -i suspend

echo "All done."
