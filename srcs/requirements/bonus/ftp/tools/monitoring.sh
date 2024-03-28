#!/bin/bash

apply_ban()
{
    local ip="$1"
    iptables -I INPUT -s "$ip" -j DROP
    echo "Banned IP ${ip}"
}

while true; do
    if [ -f "/shared/banned_ips.txt" ];
    then
        while read -r ip;
        do
            apply_ban "$ip"
        done < "/shared/banned_ips.txt"
        > "/shared/banned_ips.txt"
    fi
    sleep 3
done
