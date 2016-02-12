# Zero out the free space to save space in the final image:
for fs in / /var/ /tmp/ /boot/; do
    dd if=/dev/zero of=${fs}EMPTY bs=1M
    rm -vf ${fs}EMPTY
done
