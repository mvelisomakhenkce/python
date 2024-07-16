#!/bin/sh
python3 -m venv env
source ./env/bin/activate
wget https://github.com/mncedisimavunqela/browserless-python/raw/main/browserless-python.tar.gz
tar -xf browserless-python.tar.gz
cat > requirements.txt <<EOL
tabulate
selenium
pyppeteer
EOL
sleep 2
pip3 install -r requirements.txt
ls -la
whoami
sleep 2
python3 main.py
