#!/bin/bash

esp_idf_version=${INPUT_ESP_IDF_VERSION:-v4.1}

echo -e "\n## Installing prerequisites"

DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata

case $esp_idf_version in
  latest | v4.2 | v4.2.* | release-v4.2)
    sudo apt-get install -y git wget flex bison gperf python3 python3-pip python3-setuptools python-is-python3 python3-libusb1 cmake ninja-build ccache libffi-dev libssl-dev dfu-util
    ;;
  v4.1 | v4.1.* | release/v4.1)
    sudo apt-get install -y git wget flex bison gperf python3 python3-pip python3-setuptools python-is-python3 python3-libusb1 cmake ninja-build ccache libffi-dev libssl-dev
    ;;
  v4.0.* | release/v4.0)
    apt-get install -y git wget libncurses-dev flex bison gperf python3 python3-pip python3-setuptools python-is-python3 python3-libusb1 cmake ninja-build ccache libffi-dev libssl-dev
    ;;
  *)
    echo "Unimplemented ESP-IDF version !"
    exit 1
    ;;
esac

mkdir ~/esp
cd ~/esp
git clone -b $esp_idf_version --recursive https://github.com/espressif/esp-idf.git
cd ~/esp/esp-idf

echo -e "\n## Installing tools"
./install.sh > ~/esp-idf-install.log 2>&1
