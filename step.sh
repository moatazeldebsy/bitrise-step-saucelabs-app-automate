#!/bin/bash
set -ex

echo "Install Saucectl"

curl -L https://saucelabs.github.io/saucectl/install | bash

saucectl -v

echo "Authorize Saucectl"

saucectl configure --username $SAUCE_USERNAME --accessKey $SAUCE_ACCESS_KEY


echo "starting uploading the app and test app to Saucelabs and running the automated tests"

if [ "$SAUCE_CONFIG_FILE_PATH" == "" ]; 
then
	saucectl run --config .sauce/config.yml
else
saucectl run --config $SAUCE_CONFIG_FILE_PATH
fi