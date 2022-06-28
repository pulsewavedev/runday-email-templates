#!/usr/bin/env bash

TEMPLATE=$1
aws ses send-templated-email --source mail@runday.io --destination ToAddresses=dev@pulsewavelabs.com,eli.m.bates@gmail.com --template runday-$TEMPLATE --template-data file://./templates/$TEMPLATE/$TEMPLATE.test.json