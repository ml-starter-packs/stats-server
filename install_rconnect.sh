#!/usr/bin/sh
apt-get -yqq update && apt-get install curl iproute2

# install RStudio Connect
# TODO: does this actually require a license to use? Cannot get through setup process on port 13939
curl -Lo rsc-installer.sh https://cdn.rstudio.com/connect/installer/installer-v1.9.5.sh
./rsc-installer.sh 2021.12.0

apt-get -qq purge curl iproute2
apt-get -qq clean
rm -rf /var/lib/apt/lists/*
