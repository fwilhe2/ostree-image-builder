#!/bin/bash

BUILD_STATUS_FINISHED="FINISHED"
BUILD_STATUS_FAILED="FAILED"

# sudo composer-cli blueprints push blueprint.toml

# UUID=$(sudo composer-cli compose start-ostree --ref fedora/38/$(uname -i)/updates/silverblue ostree-demo iot-container)

# command="sudo composer-cli compose status"

# echo "Waiting for blueprint build to finish building.."
# while [[ $($command | grep "$UUID" | grep "${BUILD_STATUS_FINISHED}" >/dev/null; echo $?) != "0" ]]; do

#     if $command | grep "${UUID}" | grep "${BUILD_STATUS_FAILED}" ; then
#         echo "Image compose failed."
#         exit 1
#     else
#       echo $($command | grep "${UUID}")
#     fi
#     sleep 20
# done

sudo composer-cli blueprints push blueprint.toml

UUID=$(sudo composer-cli compose start-ostree ostree-demo qcow2)

command="sudo composer-cli compose status"

echo "Waiting for blueprint build to finish building.."
while [[ $($command | grep "$UUID" | grep "${BUILD_STATUS_FINISHED}" >/dev/null; echo $?) != "0" ]]; do

    if $command | grep "${UUID}" | grep "${BUILD_STATUS_FAILED}" ; then
      echo "Image compose failed."
      exit 1
    else
      echo $($command | grep "${UUID}")
    fi
    sleep 20
done