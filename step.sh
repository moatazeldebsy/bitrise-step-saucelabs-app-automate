#!/bin/bash
set -ex

echo "Install Saucectl"

npm install -g saucectl

saucectl -v

echo "Authorize Saucectl"

saucectl configure --username $SAUCE_USERNAME --accessKey $SAUCE_ACCESS_KEY


echo "starting uploading the app and test app to Saucelabs and running the automated tests"


saucectl run --config $SAUCE_CONFIG_FILE_PATH
