#!/bin/bash

source ~/esp/esp-idf/export.sh

cd "$1"

echo -e "\n\n## Reconfigure the project"
idf.py reconfigure

echo -e "\n\n## Build the app"
idf.py app

echo -e "\n\n## Show sizes"
idf.py size

