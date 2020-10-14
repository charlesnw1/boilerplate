#!/bin/bash

VPN_DNS="usvpn.turnsys.com"

CURRENT_WAN_IP="$(curl -s http://checkip.dyndns.org | sed -E 's/<[^>]*>//g'|awk -F ':' '{print $2}' )"
CURRENT_VPNDNS_IP="$(dig +short $VPN_DNS)"

echo Current WAN IP is: $CURRENT_WAN_IP
echo Current VPN IP is: $CURRENT_VPNDNS_IP
