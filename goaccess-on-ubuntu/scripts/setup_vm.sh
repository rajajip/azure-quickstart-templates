#!/bin/bash

# Update Packages 
apt-get -y update

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
mkdir /var/log/azure/Microsoft.Azure.Networking.ApplicationGateway.LogProcessor
touch /var/log/azure/Microsoft.Azure.Networking.ApplicationGateway.LogProcessor/access_log.log
unzip -o publish.zip
mv publish /usr/share/AppGatewayLogProcessor
echo $1 >> /usr/share/AppGatewayLogProcessor/blobsasuri.key
chmod 644 /usr/share/AppGatewayLogProcessor/blobsasuri.key
dotnet /usr/share/AppGatewayLogProcessor/AppGatewayLogProcessor.dll &

# Install and Setup GoAccess
sh install_goaccess.sh
