#!/bin/bash

# Update & upgrade system
apt update && apt upgrade -y

apt install git -y           
pip install -U pip    

# Clone the repo 
if [ -z $UPSTREAM_REPO ]
then
  echo "Cloning main Repository"
  git clone https://github.com/henockjoy/Yoonv2 /Yoonv2
else
  echo "Cloning Custom Repo from $UPSTREAM_REPO "
  git clone $UPSTREAM_REPO /Yoonv2
fi

# Upgrade pip and install requirements
cd /Yoon2
pip install -U -r requirements.txt --force-reinstall

# Start bot
echo "Starting Bot...."
python3 bot.py
