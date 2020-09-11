#!/bin/bash

set -e

systemctl disable ModemManager
systemctl stop ModemManager

function info { echo -e "[Info] $*"; }
function error { echo -e "[Error] $*"; exit 1; }
function warn  { echo -e "[Warning] $*"; }

test $? -eq 0 || exit 1 "you should have sudo priveledge to run this script"

info "Installing the must-have pre-requisites"

while read -r p ; do sudo apt-get install -y $p ; done < <(cat << "EOF"
	software-properties-common
	apparmor-utils 
	apt-transport-https 
	avahi-daemon 
	ca-certificates 
	curl 
	dbus 
	jq 
	network-manager
EOF
)

fi