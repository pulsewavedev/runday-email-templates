#!/usr/bin/env bash

TEMPLATE=$1

RAW_HTML=$(mjml ./templates/$TEMPLATE/$TEMPLATE.mjml --config.minify true)

HTML=$(echo $RAW_HTML | sed -e 's/"/\\\\"/g')

TEXT=$(echo $RAW_HTML | html-to-text --ignore-image --noLinkBrackets | sed -e 's/"/\\\\"/g')
TEXT=$(while IFS= read -r line; do echo "$line\\\\r\\\\n"; done <<< "$TEXT" | tr -d '\n')

mkdir -p ./build
cat ./templates/$TEMPLATE/$TEMPLATE.json | sed -e "s~%html%~$HTML~" -e 's/%html%/\&/g' -e "s~%text%~$TEXT~" -e 's/%text%/\&/g' > ./build/$TEMPLATE.json

cat ./build/$TEMPLATE.json

set -x

aws ses delete-template --template-name runday-$TEMPLATE
aws ses create-template --cli-input-json file://build/$TEMPLATE.json

