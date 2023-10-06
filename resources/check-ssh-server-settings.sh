#!/bin/bash

source settings.conf

# Check SSH port
PORTCHECK=$(grep -E "^Port $SSHPORT" /etc/ssh/sshd_config)
if [ "$PORTCHECK" == "" ] ;then
    echo "SSH Port $SSHPORT not configured."
    echo "Modifying configuration..."
    sed -Ei "s/(^#?Port .*)($)/\1\nPort $SSHPORT/" /etc/ssh/sshd_config
else
    echo "SSH Port $SSHPORT: OK"
fi


# Check GatewayPorts
GWCHECK=$(grep -E '^GatewayPorts ' /etc/ssh/sshd_config)
if [ "$GWCHECK" == "GatewayPorts $GWPORTS" ] ;then
    echo "GatewayPorts: OK"
elif [ "$GWCHECK" != "" ] && [ "$GWCHECK" != "GatewayPorts $GWPORTS" ] ; then
    echo "Current GatewayPorts setting: $GWCHECK"
    echo "Changing to: GatewayPorts $GWPORTS"
    sed -Ei "s/^GatewayPorts.*/GatewayPorts $GWPORTS/" /etc/ssh/sshd_config
else
    echo "GatewayPorts not configured. Changing setting..."
    echo "GatewayPorts $GWPORTS" >> /etc/ssh/sshd_config
fi

echo "Restarting ssh service so changes take effect..."
systemctl restart ssh

echo "DONE!"
