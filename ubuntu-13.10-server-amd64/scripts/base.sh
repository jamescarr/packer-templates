#!/bin/sh -x

#Turn off and disable ufw
echo "Stopping ufw..."
service ufw stop
echo "Disabling ufw..."
ufw disable

#Don't do reverse DNS lookups of SSH clients that connect; this usually speeds up SSH by quite a bit:
echo "UseDNS no" >> /etc/ssh/sshd_config