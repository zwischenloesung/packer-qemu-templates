# Enable grub serial access for virsh console and disable timeout
sed -i -e 's/^\(GRUB_CMDLINE_LINUX=.*\)"$/GRUB_CMDLINE_LINUX="console=tty0 console=ttyS0,115200n8"/g' \
	   -e '/GRUB_CMDLINE_LINUX=/ a GRUB_SERIAL_COMMAND="serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1"' \
	   -e 's/^#GRUB_TERMINAL=.*/GRUB_TERMINAL="console serial"/g' \
	   -e 's/^\(GRUB_TIMEOUT=.*\)/GRUB_TIMEOUT=0/' /etc/default/grub

echo >> /etc/default/grub
echo "# Don't probe every partition for other operating systems" >> /etc/default/grub
echo "GRUB_DISABLE_OS_PROBER=true" >> /etc/default/grub

update-grub
