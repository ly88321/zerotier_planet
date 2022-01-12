#!/bin/bash 
# debain ubuntu自动安装zerotier 并设置的为planet服务器
# addr服务器公网ip+port
 ip=`wget http://ipecho.net/plain -O - -q ; echo`
 addr=$ip/9993
 apt autoremove
 apt update -y
 apt install curl -y
 echo "********************************************************************************************************************"
 echo "**********deabin unbuntu自动安装zerotier 并设置的为planet服务器 火木木制作 放在root目录执行**********************************"
 curl -s https://install.zerotier.com/ | sudo bash
 
 identity=`cat /var/lib/zerotier-one/identity.public`
 echo "identity :$identity=============================================="
 apt-get -y install build-essential
 apt-get install git -y
 git clone https://gitee.com/opopop880/ZeroTierOne.git
 cd ./ZeroTierOne/attic/world/
sed -i '/roots.push_back/d' ./mkworld.cpp
sed -i '/roots.back()/d' ./mkworld.cpp 
sed -i '85i roots.push_back(World::Root());' ./mkworld.cpp 
sed -i '86i roots.back().identity = Identity(\"'"$identity"'\");' ./mkworld.cpp 
sed -i '87i roots.back().stableEndpoints.push_back(InetAddress(\"'"$addr"'\"));' ./mkworld.cpp 
source ./build.sh
./mkworld
mv ./world.bin ./planet
\cp -r ./planet /var/lib/zerotier-one/
\cp -r ./planet /root
systemctl restart zerotier-one.service
wget https://gitee.com/opopop880/ztncui/attach_files/932632/download/ztncui_0.8.6_amd64.deb
sudo dpkg -i ztncui_0.8.6_amd64.deb
cd /opt/key-networks/ztncui/
echo "HTTPS_PORT = 3443" >>./.env
secret=`cat /var/lib/zerotier-one/authtoken.secret`
echo "ZT_TOKEN = $secret" >>./.env
echo "ZT_ADDR=127.0.0.1:9993" >>./.env
echo "NODE_ENV = production" >>./.env
echo "HTTP_ALL_INTERFACES=yes" >>./.env
systemctl restart ztncui
rm -rf /root/ZeroTierOne
echo "**********安装成功*********************************************************************************"

