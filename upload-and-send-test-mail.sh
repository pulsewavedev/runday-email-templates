#!/usr/bin/env bash

TEMPLATE=$1

./upload-ses-template.sh $TEMPLATE
./send-email.sh $TEMPLATE