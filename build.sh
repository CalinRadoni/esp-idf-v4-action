#!/bin/bash

source ~/esp/esp-idf/export.sh

esp_idf_version="$1"
src_directory="$2"
idf_reconfigure="$3"

cd "$src_directory"

if [[ "$idf_reconfigure" == "true" ]]; then
  echo -e "\n\n## Reconfigure the project"
  idf.py reconfigure
fi

echo -e "\n\n## Build the app"
idf.py app

echo -e "\n\n## Show sizes"
idf.py size

