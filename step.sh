#!/bin/bash
set -ex

echo "Install Saucectl"

npm install -g saucectl

saucectl -v

echo "Authorize Saucectl"

saucectl configure --username $SAUCE_USERNAME --accessKey $SAUCE_ACCESS_KEY


echo "starting uploading the app and test app to Saucelabs and running the automated tests"


if [ "${saucelabs_config_path}" = "" ]
then
	saucectl run --config .sauce/config.yml
else
	saucectl run --config ${saucelabs_config_path}
fi