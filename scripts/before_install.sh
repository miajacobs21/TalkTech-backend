#!/bin/bash

DIT="/home/ec2-user/TalkTech-backend"
if [ -d "$DIR" ]; then
  cd /home/ec2-user
  sudo rm -rf TalkTech-backend
else
  echo "Directory does not exist"
fi
