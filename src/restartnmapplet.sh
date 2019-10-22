#!/bin/bash

killall -9 nm-applet

screen -d -m -S nmapplet nm-applet
