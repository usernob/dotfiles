#!/bin/bash
# wifi-menu
chosen_network=$@
if [[ -z $chosen_network ]]; then
    # If we have not chosen a network, the previous command will return an empty string
    # and we can exit right away
    nmcli -g SSID device wifi
fi

if [[ -n $(nmcli -g NAME connection | grep "${chosen_network}") ]]; then
    nmcli connection up id "${chosen_network}" > /dev/null 2>&1
else
    exit 1
fi
