#!/bin/bash

. /gitea/gitea-config.sh

configGitea
gitea --config /usr/local/gitea/etc/app.ini web
