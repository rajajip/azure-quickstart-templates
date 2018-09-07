#!/bin/bash

# Save and Setup Blob SaS Uri
mkdir /usr/share/appgw
echo $1 >> /usr/share/appgw/blobsasuri.key
chmod 644 /usr/share/appgw/blobsasuri.key

# Install .Net Core current version
sh dotnet-install.sh -c Current

# Install and Setup GoAccess
sh install_goaccess.sh
