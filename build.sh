#!/bin/bash

source ~/esp/esp-idf/export.sh

src_directory=${INPUT_SRC_DIRECTORY:-.}
idf_reconfigure=${INPUT_IDF_RECONFIGURE:-true}

echo $INPUT_SRC_DIRECTORY
echo $src_directory
pwd
ls -al

cd "$src_directory"
pwd
ls -al

if [[ "$idf_reconfigure" == "true" ]]; then
  echo -e "\n\n## Reconfigure the project"
  idf.py reconfigure
fi

echo -e "\n\n## Build the app"
idf.py app

echo -e "\n\n## Show sizes"
idf.py size

