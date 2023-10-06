#!/bin/bash

# Need to add a check that the script is run as root here

echo "Loading settings..."
source ./settings.conf

echo "SSH Tunnel User: $SSHUSER"
echo "SSH Server Port: $SSHPORT"
echo "SSH Server IP: $LHOST"
echo "SSH Server Web Port: $LPORT"

# Check SSH server configuration...
source resources/check-ssh-server-settings.sh

# Run user creation script...
source resources/make-ssh-user.sh

# Generate executable payloads...
source resources/generate-windows-script.sh
source resources/generate-linux-script.sh

# Display final output...
cat resources/output-template.txt | \
sed -E "s/\\\$SSHUSER/$SSHUSER/g" | \
sed -E "s/\\\$SSHPORT/$SSHPORT/g" | \
sed -E "s/\\\$LHOST/$LHOST/g" | \
sed -E "s/\\\$LPORT/$LPORT/g"
