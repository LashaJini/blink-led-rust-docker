#!/bin/bash

# This scripts runs when we ssh into raspberry pi

SERVICE_NAME=$1
SERVICE_PATH=/etc/systemd/system/${SERVICE_NAME}

if [ ! -f ${SERVICE_PATH} ];then
  echo -e "\n[***] Service Does Not Exist...Creating...\n"

  sudo cp /tmp/${SERVICE_NAME} ${SERVICE_PATH}

  systemctl daemon-reload && \
    systemctl enable ${SERVICE_NAME} && \
    systemctl start ${SERVICE_NAME}
else
  echo -e "\n[***] Service Exists...Restarting...\n"

  sudo systemctl restart ${SERVICE_NAME}
fi
