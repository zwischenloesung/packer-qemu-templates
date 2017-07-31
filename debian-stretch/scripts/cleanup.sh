# Clean up
apt-get -y autoremove
apt-get -y clean

# Removing leftover leases and persistent rules
rm /var/lib/dhcp/*

# Make sure Udev doesn't block our network
rm /etc/udev/rules.d/70-persistent-net.rules
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/
rm /lib/udev/rules.d/75-persistent-net-generator.rules
echo "pre-up sleep 2" >> /etc/network/interfaces

# disable reverse dns lookups on sshd
echo "UseDNS no" >> /etc/ssh/sshd_config
