#!/usr/bin/env bash

TEMPLATE=$1
aws ses send-templated-email --source mail@runday.io --destination ToAddresses=dev@pulsewavelabs.com --template runday-$TEMPLATE --template-data file://./templates/$TEMPLATE/$TEMPLATE.test.json