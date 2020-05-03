CC       = gcc
CFLAGS  += -Wall -Os -fomit-frame-pointer -g -m32 -Iarch/x86_64/  -I.
OCAMLINCDIRS = 
OCAMLOPT = /home/dakk/.opam/4.09.1+32bit/bin/ocamlopt $(OCAMLINCDIRS)
OCAMLDEP = ocamldep -native $(OCAMLINCDIRS)
OCAMLDOC = ocamldoc $(OCAMLINCDIRS)
LD       = ld
LDFLAGS	 = -ffreestanding -O2 -nostdlib
ARCH = arch/x86_64
MAIN_RUN_C	= 
MAIN_RUN_OBJS	= $(MAIN_RUN_C:.c=.o)
ARCH_RUN_OBJS	= $(ARCH)/boot.o
MK_C	 = $(wildcard c-stubs/*.c) 
MK_OBJS	 = $(MK_C:.c=.o)
OBJS	 = $(MAIN_RUN_OBJS) $(ARCH_RUN_OBJS) $(MK_OBJS)
LIBOCAML	= build/libml.a
CAMLLIB		= /home/dakk/.opam/4.09.1+32bit/lib/ocaml/
OCAMLKERNEL	= build/mlkernel.o
MLI=vid.mli mem.mli
ML=mem.ml vid.ml kmain.ml
CMX	 = $(ML:.ml=.cmx)
CMI = $(MLI:.mli=.cmi) 
CMXA =

all: kernel depend

kernel: $(LIBOCAML) $(OBJS) $(LINK_SCRIPT)
	gcc -m32 $(LDFLAGS) -static -o build/kernel.bin \
        $(OBJS) $(LIBOCAML) -Tkernel.ld 


$(OCAMLKERNEL): $(CMI) $(CMX)
	$(OCAMLOPT) -I build/ $(CMXA) $(CMX) -output-obj -o $@

$(LIBOCAML): $(CMI) $(CMX) $(OCAMLKERNEL)
	rm -rf build/libasmrun build/stdlib build/k
	mkdir build/libasmrun; cd build/libasmrun; ar -x $(CAMLLIB)/libasmrun.a
	# mkdir -p str; cd str; ar -x $(CAMLLIB)/str.a
	ar -qc $(LIBOCAML) build/libasmrun/*.o build/mlkernel.o
	rm -rf build/libasmrun

%.o: %.S
	gcc -m32 -c -o $@ $<

# %.o: %.asm
# 	nasm -f elf -o $@ $<

%.cmi: %.mli
	$(OCAMLOPT) -g -c $< $(OCAMLFLAGS_$@) -I build/ -o build/$@

%.cmx: %.ml
	$(OCAMLOPT) -dalloc -g -c $< $(OCAMLFLAGS_$@) -I build/ -o build/$@

depend: .depend

.depend: $(MLI) $(ML)
	$(OCAMLDEP) $(MLI) $(ML) > build/.depend

run:
	qemu-system-i386 -kernel build/kernel.bin

dump:
	objdump -g -C -d -mi386:x86-64:intel build/kernel.bin > kernel.S
	objdump -g -d -mi386:x86-64:intel build/kmain.o > kmain.S

clean:
	rm -fr ../build/* build/*
	rm -f *.o *.a *.cmi *.cmx *.bin *.depend
	rm -f arch/x86_64/*.o
	rm -f c-stubs/*.o 
