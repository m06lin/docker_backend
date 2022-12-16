#!/bin/bash

docker-compose up -d 
apt-get update -y
apt-get install wget libnss3-tools
wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-amd64
mv mkcert-v1.4.3-linux-amd64 /usr/bin/mkcert
chmod +x /usr/bin/mkcert

mkcert "*.accuhit.localhost"
mkcert "*.php8.accuhit.localhost"
mkcert "*.php81.accuhit.localhost"
mkcert "*.127.0.0.1.nip.io"
mkcert "*.php8.127.0.0.1.nip.io"
mkcert "*.php81.127.0.0.1.nip.io"
mkcert -install
mv _wildcard.* ./nginx/ssl

apt-get install dnsmasq
sed -i '' s/#port=5353/port=53/g $(brew --prefix)/etc/dnsmasq.conf
cp ./dnsmasq/accuhit.local $(brew --prefix)/etc/dnsmasq.d/
services restart dnsmasq