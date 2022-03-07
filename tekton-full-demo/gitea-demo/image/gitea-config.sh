#!/bin/bash

if [[ ! -f /usr/local/gitea/installed ]]
then
  for i in bin etc custom data db git
  do
    mkdir /usr/local/gitea/${i}
  done
  
  export INTERNAL_TOKEN=$(gitea generate secret INTERNAL_TOKEN)
  export SECRET_KEY=$(gitea generate secret SECRET_KEY)
  export JWT_SECRET=$(gitea generate secret JWT_SECRET)
  envsubst < /gitea/app.ini > /usr/local/gitea/etc/app.ini

  gitea --config /usr/local/gitea/etc/app.ini migrate
  gitea --config /usr/local/gitea/etc/app.ini admin user create --admin --username gitea --password password --email gitea@gitea.crc.testing --must-change-password
  gitea --config /usr/local/gitea/etc/app.ini admin user create --username devuser --password password --email devuser@gitea.crc.testing --must-change-password
  touch /usr/local/gitea/installed
fi

gitea --config /usr/local/gitea/etc/app.ini web