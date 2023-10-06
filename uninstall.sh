#!/bin/bash

source settings.conf
userdel -f -r $SSHUSER
rm -rfv webroot/
cp -Rv webroot-clean webroot
