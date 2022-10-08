#!/bin/bash

# Making dnf faster
echo "Setting: Maximum parallel downloads: 10"
sudo echo  'max_parallel_downloads=20' >>  /etc/dnf/dnf.conf
echo "Done: Maximum parallel downloads: 10"
echo "Setting: Enable fastest mirrors"
sudo echo  'fastestmirror=true' >>  /etc/dnf/dnf.conf
echo "Done: Enable fastest mirrors"

# enabling rpm fusion
echo "Setting: Enable RPM Fusion"
sudo dnf install -y \
https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
echo "Done: Enable RPM Fusion"

echo "Setting: Delta RPM"
sudo echo 'deltarpm=true' >> /etc/dnf/dnf.conf
sudo echo 'defaultyes=true' >> /etc/dnf/dnf.conf
echo "Done: Delta RPM"

# Updating system
echo "Performing System Updates"
sudo dnf check-updates
sudo dnf upgrade -y
echo "Done: System Updates"

# Reboot
echo "Rebooting in 3 seconds"
sleep 3
sudo reboot
