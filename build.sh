#!/bin/sh

apk add py3-scikit-learn py3-pip

# remove docker image python
rm -rf /usr/local/bin/pip
rm -rf /usr/local/bin/pip3
rm -rf /usr/local/bin/python
rm -rf /usr/local/bin/python3
rm -rf /usr/local/bin/python-config 
rm -rf /usr/local/bin/python3-config
rm -rf /usr/local/bin/python3.11 
rm -rf /usr/local/bin/python3.11-config

# install runner deps
pip3 install json-rpc

# set chmod
chmod 777 -R /tmp && chmod o+t -R /tmp
