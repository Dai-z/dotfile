#!/bin/bash

gdbus monitor -y -d org.freedesktop.login1 |
  while read x; do
    if [[ $x =~ "LockedHint" ]] ; then
      if [[ $x =~ "true" ]] ; then
          echo "Stop synergy on lock"
          killall synergys > /dev/null 2> /dev/null
          killall synergy > /dev/null 2> /dev/null
      else
          status "Start synergy on unlock"
          /usr/bin/synergys -f --no-tray --debug DEBUG --name daiz-PC --enable-crypto --address :24800 -l /tmp/fuck.log --display :1
      fi
    fi
  done

