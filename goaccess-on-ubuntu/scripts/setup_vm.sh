#!/bin/bash

# Update Packages 
apt-get -y update

# Save and Setup Blob SaS Uri
mkdir /usr/share/appgw
echo $1 >> /usr/share/appgw/blobsasuri.key
chmod 644 /usr/share/appgw/blobsasuri.key

#Install Libcurl3, unzip
apt-get -y install libcurl3 unzip

# Install .Net Core current version
# sh dotnet-install.sh -c Current
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

apt-get -y install apt-transport-https
apt-get -y update
apt-get -y install aspnetcore-runtime-2.1

# Install Log Processor Application
unzip -o publish.zip
dotnet ./publish/AppGatewayLogProcessor.dll &

# Install and Setup GoAccess
sh install_goaccess.sh
