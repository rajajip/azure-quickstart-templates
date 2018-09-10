#!/bin/bash

# Add Official GoAccess Repository
echo "deb http://deb.goaccess.io/ $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/goaccess.list
wget -O - https://deb.goaccess.io/gnugpg.key | sudo apt-key add -

# Update Packages 
apt-get -y update

# Install Apache2
apt-get -y install apache2

# Install GoAccess
apt-get -y install goaccess

# Start GoAccess
goaccess /var/log/azure/Microsoft.Azure.Networking.ApplicationGateway.LogProcessor/access_log.log -o /var/www/html/report.html --real-time-html --port=8080 --log-format='"%^": "%dT%t+%^","%^": {%^=>%^, %^=>"%h", %^=>%^, %^=>"%m", %^=>"%U", %^=>"%q", %^=>"%u", %^=>"%s", %^=>"%H", %^=>"%b", %^=>%^, %^=>"%T", %^=>%^},' --time-format='%T' --date-format='%Y-%m-%d' &

# restart Apache
apachectl restart






