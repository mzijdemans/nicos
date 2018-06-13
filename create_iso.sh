#!/usr/bin/env bash
mkdir -p iso/boot/grub              # create the folder structure
cp stage2_eltorito iso/boot/grub/   # copy the bootloader
cp kernel.elf iso/boot/             # copy the kernel

#    iso
#    |-- boot
#      |-- grub
#      | |-- menu.lst
#      | |-- stage2_eltorito
#      |-- kernel.elf

# generate the ISO
genisoimage -R                              \
            -b boot/grub/stage2_eltorito    \
            -no-emul-boot                   \
            -boot-load-size 4               \
            -A os                           \
            -input-charset utf8             \
            -quiet                          \
            -boot-info-table                \
            -o os.iso                       \
            iso