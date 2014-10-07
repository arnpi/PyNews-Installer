#!/bin/bash

CURRENT_DIR=$PWD
CURRENT_USER=$USER
INSTALL_DIR="/home/micromus/pynews_env"

echo "This script will install PyNews development version"
echo "First install virtualenv, need root login"
# su -c "apt-get install python-virtualenv"
echo "done"

echo "Back in normal user"
# su - $USER 
cd
ls
echo "Remove old pynews_env if exist:"
rm -rf $INSTALL_DIR 

echo "Create empty virtualenv (pynews_env)"
virtualenv $INSTALL_DIR --no-site-packages

echo "Enter virtualenv directory"
cd $INSTALL_DIR 
ls
echo "Get PyNews last version:"
git clone https://github.com/arnpi/PyNews.git
#cp ~/pynews .
# tar xzvf ~/pynews.tar.gz

echo "Activate virtuel environnement"
cd PyNews
source ../bin/activate
ls
# exit 0
# echo "Install dependencies"
# bin/python setup.py develop
# ../bin/pip install imap_cli
# ../bin/pip install oauth2
# ../bin/pip install feedparser
# ../bin/pip install beautifulsoup
# ../bin/pip install six

echo "Build development PyNews version:"
../bin/pip install -e .
# ../bin/python setup.py develop

echo "Initialize data"
rm -rf PyNews.sqlite
../bin/initialize_PyNews_db development.ini

echo "Launch development server"
../bin/pserve --reload development.ini

echo "Back in user directory"
# cd
