#!/bin/bash

# Save and Setup Blob SaS Uri
mkdir /usr/share/appgw
echo $1 >> /usr/share/appgw/blobsasuri.key
chmod 644 /usr/share/appgw/blobsasuri.key

# Install .Net Core current version
# sh dotnet-install.sh -c Current
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
apt-get install apt-transport-https
apt-get update
apt-get install aspnetcore-runtime-2.1

# Install and Setup GoAccess
sh install_goaccess.sh
