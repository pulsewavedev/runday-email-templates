#!/usr/bin/env bash

TEMPLATE=$1
aws ses test-render-template --template-name runday-$TEMPLATE --template-data file://./templates/$TEMPLATE/$TEMPLATE.test.json