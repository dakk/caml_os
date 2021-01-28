CC       = gcc -m32
AR 		 = ar --target=elf32-i386
AS 		 = i686-elf-as
LD       = ld -b elf32-i386
OBJDUMP	 = i686-elf-objdump
CFLAGS  += -Wall -Os -fomit-frame-pointer -g -Iarch/i686/  -I.
OCAMLINCDIRS = -I build -I build/drivers
OCAMLOPT = /home/dakk/.opam/4.11.1+32bit/bin/ocamlopt $(OCAMLINCDIRS) -unsafe
OCAMLDEP = ocamldep -native $(OCAMLINCDIRS)
OCAMLDOC = ocamldoc $(OCAMLINCDIRS)
LDFLAGS	 = -nostdlib #-ffreestanding -O2
ARCH = arch/i686
MAIN_RUN_C	= 
MAIN_RUN_OBJS	= $(MAIN_RUN_C:.c=.o)
ARCH_RUN_OBJS	= $(ARCH)/boot.o
MK_C	 = $(wildcard c-stubs/*.c) 
MK_OBJS	 = $(MK_C:.c=.o)
OBJS	 = $(MAIN_RUN_OBJS) $(ARCH_RUN_OBJS) $(MK_OBJS)

LIBOCAML	= build/libml.a
CAMLLIB		= /home/dakk/.opam/4.11.1+32bit/lib/ocaml/
OCAMLKERNEL	= build/mlkernel.o
MLI=mem.mli $(wildcard drivers/*.mli) orc.mli
ML=mem.ml $(wildcard drivers/*.ml) orc.ml kmain.ml 
CMX	 = $(ML:.ml=.cmx)
CMI = $(MLI:.mli=.cmi) 
CMXA =

all: kernel depend

kernel: $(LIBOCAML) $(OBJS) $(LINK_SCRIPT)
	$(LD) $(LDFLAGS) -static -o build/kernel.bin \
        $(OBJS) $(LIBOCAML) -Tkernel.ld 


$(OCAMLKERNEL): $(CMI) $(CMX)
	$(OCAMLOPT) -linkall $(CMXA) $(CMX) -output-obj -o $@

$(LIBOCAML): $(CMI) $(CMX) $(OCAMLKERNEL)
	rm -rf build/libasmrun
	mkdir build/libasmrun; cd build/libasmrun; ar -x $(CAMLLIB)/libasmrun.a
	$(AR) -qc $(LIBOCAML) build/libasmrun/*.o build/mlkernel.o
	rm -rf build/libasmrun

%.o: %.S
	$(AS) -o $@ $<

# %.o: %.asm
# 	nasm -f elf -o $@ $<

%.cmi: %.mli
	$(OCAMLOPT) -g -c $< -o build/$@

%.cmx: %.ml
	$(OCAMLOPT) -g -c $< -o build/$@

depend: .depend

.depend: $(MLI) $(ML)
	$(OCAMLDEP) $(MLI) $(ML) > build/.depend

run:
	qemu-system-i386 -kernel build/kernel.bin

dump:
	$(OBJDUMP) -g -C -d -mi386:x86-64:intel build/kernel.bin > kernel.S

clean:
	rm -fr ../build/* build/*
	rm -f *.o *.a *.cmi *.cmx *.bin *.depend
	rm -f arch/x86_64/*.o
	rm -f c-stubs/*.o 
	mkdir build/drivers
