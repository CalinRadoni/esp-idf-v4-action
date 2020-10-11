#!/bin/bash

source ~/esp/esp-idf/export.sh

cd "$1"

idf.py reconfigure
idf.py app
idf.py size

