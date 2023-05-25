#!/bin/bash

if [[ -z $MOCK_HOSTNAME ]]; then
    echo "MOCK_HOSTNAME must be set"
    exit 1
fi

mock_ip_address=$(dig +short $MOCK_HOSTNAME)

echo 'INFO - Make traffic to 169.254.169.254 go through local mock server'
iptables -t nat -A OUTPUT -d 169.254.169.254 -j DNAT --to-destination ${mock_ip_address}

exec $@
