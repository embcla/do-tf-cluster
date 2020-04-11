#!/bin/bash
export ETCD_VOLUME=$(echo $ETCD_VOLUME | sed  's/[\-]/_/g')
export ETCD_FOLDER=$(echo $ETCD_FOLDER | sed  's/[\-]/_/g')

