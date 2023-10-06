#!/bin/bash

source ./settings.conf

cd webroot
python3 -m http.server $LPORT
cd ..
