#!/bin/bash

echo "===================update & upgrading systems==================="
sudo apt-get update && sudo apt-get upgrade -y

echo "===================installing essential tools==================="
sudo apt-get install vim openvpn wget curl xz-utils -y

echo "===================installing nodejs==================="
wget https://nodejs.org/dist/v18.13.0/node-v18.13.0-linux-x64.tar.xz

echo "===================unzipping nodejs==================="
tar -xvf node-v18.13.0-linux-x64.tar.xz

echo "===================moving nodejs to system==================="
sudo cp -r node-v18.13.0-linux-x64/{bin,include,lib,share} /usr/

echo "===================checking if nodejs installed correctly==================="
node --version

echo "========Resolving EACCES permissions errors when installing packages globally========"
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo "export PATH=~/.npm-global/bin:$PATH" >> ~/.profile
source ~/.profile

echo "===================installinig docker==================="
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

echo "===================checking if docker installed correctly==================="
docker --version

echo "===================install portainer==================="
sudo docker volume create portainer_data
sudo docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:2.9.3
sudo docker ps

echo "===================Installing dependencies for puppeteer==================="
sudo apt-get install ca-certificates fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgbm1 libgcc1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 lsb-release wget xdg-utils -y

echo "====================================Docker Post Installation======================================="
sudo groupadd docker
sudo usermod -aG docker $USER

echo "========================Verify that you can run docker commands without sudo====================="
docker ps



