#!/bin/bash

# inhibited?
~/.config/sway/idle/inhibitors/pulse.sh || exit 1

sudo systemctl suspend
