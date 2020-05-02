CC       = gcc
CFLAGS  += -Wall -Os -fomit-frame-pointer -g  -Iarch/x86_64/  -I.
OCAMLINCDIRS = 
OCAMLOPT = ocamlfind ocamlopt $(OCAMLINCDIRS)
OCAMLDEP = ocamlfind ocamldep -native $(OCAMLINCDIRS)
OCAMLDOC = ocamlfind ocamldoc $(OCAMLINCDIRS)
LD       = ld
LDFLAGS	 = -nostdlib 
ARCH = arch/x86_64
MAIN_RUN_C	= 
MAIN_RUN_OBJS	= $(MAIN_RUN_C:.c=.o)
ARCH_RUN_OBJS	= $(ARCH)/boot.o
MK_C	 = $(wildcard c-stubs/*.c) 
MK_OBJS	 = $(MK_C:.c=.o)
OBJS	 = $(MAIN_RUN_OBJS) $(ARCH_RUN_OBJS) $(MK_OBJS)
LIBOCAML	= build/libml.a
CAMLLIB		= /usr/lib/ocaml
OCAMLKERNEL	= build/mlkernel.o
MLI=vid.mli mem.mli
ML=mem.ml vid.ml kmain.ml
CMX	 = $(ML:.ml=.cmx)
CMI = $(MLI:.mli=.cmi) 
CMXA =

all: kernel depend

kernel: $(LIBOCAML) $(OBJS) $(LINK_SCRIPT)
	$(LD) $(LDFLAGS) -static -o build/kernel.elf \
        $(OBJS) $(LIBOCAML) -Tkernel.ld


$(OCAMLKERNEL): $(CMI) $(CMX)
	$(OCAMLOPT) -linkpkg -I build/ $(CMXA) $(CMX) -output-obj -o $@

$(LIBOCAML): $(CMI) $(CMX) $(OCAMLKERNEL)
	rm -rf build/libasmrun build/stdlib build/k
	mkdir build/libasmrun; cd build/libasmrun; ar -x $(CAMLLIB)/libasmrun.a
	# mkdir -p str; cd str; ar -x $(CAMLLIB)/str.a
	ar -qc $(LIBOCAML) build/libasmrun/*.o build/mlkernel.o
	rm -rf build/libasmrun

%.cmi: %.mli
	$(OCAMLOPT) -c $< $(OCAMLFLAGS_$@) -I build/ -o build/$@

%.cmx: %.ml
	$(OCAMLOPT) -dalloc -c $< $(OCAMLFLAGS_$@) -I build/ -o build/$@

depend: .depend

.depend: $(MLI) $(ML)
	$(OCAMLDEP) $(MLI) $(ML) > build/.depend

run:
	qemu-system-x86_64 -kernel build/kernel.elf

dump:
	objdump -C -d -mi386:x86-64:intel build/kernel.elf

clean:
	rm -fr ../build/* build/*
	rm -f *.o *.a *.cmi *.cmx *.elf *.depend
	rm -f arch/x86_64/*.o
	rm -f c-stubs/*.o 
