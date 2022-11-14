#!/bin/bash

docker-compose up -d 
brew install mkcert

mkcert "*.accuhit.localhost"
mkcert "*.php8.accuhit.localhost"
mkcert "*.php81.accuhit.localhost"
mkcert "*.127.0.0.1.nip.io"
mkcert "*.php8.127.0.0.1.nip.io"
mkcert "*.php81.127.0.0.1.nip.io"
mkcert -install
mv _wildcard.* ./nginx/ssl

brew install dnsmasq
sed -i '' s/#port=5353/port=53/g $(brew --prefix)/etc/dnsmasq.conf
cp ./dnsmasq/accuhit.local $(brew --prefix)/etc/dnsmasq.d/
sudo brew services restart dnsmasq