#!/bin/bash
if [ -e /lib/systemd/system/etcd.service ]
then
    rm /lib/systemd/system/etcd.service
fi

export ETCD_VOLUME=$(echo $ETCD_VOLUME | sed  's/[\-]/_/g')
export ETCD_FOLDER=$(echo $ETCD_FOLDER | sed  's/[\-]/_/g')


if [ -e "$ETCD_VOLUME" ]
then
  if [ ! -e "$ETCD_FOLDER" ]
  then
    mkdir $ETCD_FOLDER
  else
    echo "ETCD folder exists"
  fi
else
  >&2 echo "ETCD Volume does not exists"
fi
