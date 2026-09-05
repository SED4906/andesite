#!/bin/ash

set -ouex pipefail

cp -avf "/ctx/system_files"/. /

mkdir -p /var/roothome /var/home

apk add linux-firmware elogind eudev udev-init-scripts udev-init-scripts-openrc dbus dbus-x11 xorg-server xf86-input-libinput xinit mesa-dri-gallium mesa-va-gallium xfce4 xfce4-terminal xfce4-screensaver lightdm-gtk-greeter font-dejavu adwaita-xfce-icon-theme adw-gtk3 polkit-elogind xfce-polkit linux-pam firefox
rc-update delete hwdrivers sysinit || :
rc-update delete mdev sysinit || :
rc-update add udev sysinit
rc-update add udev-trigger sysinit
rc-update add udev-settle sysinit
rc-update add udev-postmount default
rc-update add elogind
rc-update add polkit
rc-update add lightdm
rc-update add dbus
