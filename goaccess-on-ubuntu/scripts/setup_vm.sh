#!/bin/bash

# Install .Net Core current version
sh dotnet-install.sh -c Current

# Install and Setup GoAccess
sh install_goaccess.sh
