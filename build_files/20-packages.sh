#!/bin/bash

set -xeuo pipefail


dnf -y install \
	-x gnome-extensions-app \
	system-reinstall-bootc \
	gnome-disk-utility \
	distrobox \
	fastfetch \
	fpaste \
	gnome-shell-extension-{appindicator,dash-to-dock,blur-my-shell} \
	just \
	powertop \
	tuned-ppd \
	wl-clipboard \
	jetbrains-mono-fonts-all \
	buildah
