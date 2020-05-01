cp kernel.elf ./iso/boot/
genisoimage -R -b stage2_eltorito -no-emul-boot \
	-boot-load-size 4 -A os -input-charset utf8 -quiet -boot-info-table -o ./os.iso ./iso
bochs -f ./bochsrc -q