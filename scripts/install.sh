#! /bin/bash
echo "--- XRASPIOS INSTALATION ---"
echo " "

echo "> Update APT"
sudo apt-get update && sudo apt-get upgrade -y

echo "> Installing Utils"

sudo apt-get install -y wget curl