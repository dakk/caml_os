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
LIBOCAML	= libml.a
CAMLLIB		= /usr/lib/ocaml
OCAMLKERNEL	= mlkernel.o
MLI=vid.mli mem.mli
ML=mem.ml vid.ml kmain.ml
CMX	 = $(ML:.ml=.cmx)
CMI = $(MLI:.mli=.cmi) 
CMXA =

all: kernel depend

kernel: $(LIBOCAML) $(OBJS) $(LINK_SCRIPT)
	$(LD) $(LDFLAGS) -static -o kernel.elf \
        $(OBJS) $(LIBOCAML) -Tkernel.ld


$(OCAMLKERNEL): $(CMI) $(CMX)
	$(OCAMLOPT) -linkpkg $(CMXA) $(CMX) -output-obj -o $@

$(LIBOCAML): $(CMI) $(CMX) $(OCAMLKERNEL)
	rm -rf libasmrun stdlib k
	mkdir libasmrun; cd libasmrun; ar -x $(CAMLLIB)/libasmrun.a
	mkdir -p str; cd str; ar -x $(CAMLLIB)/str.a
	ar -qc $(LIBOCAML) libasmrun/*.o mlkernel.o
	rm -rf libasmrun str

%.cmi: %.mli
	$(OCAMLOPT) -c $< $(OCAMLFLAGS_$@) -o $@

%.cmx: %.ml
	$(OCAMLOPT) -c $< $(OCAMLFLAGS_$@) -o $@

depend: .depend

.depend: $(MLI) $(ML)
	$(OCAMLDEP) $(MLI) $(ML) > .depend

run:
	qemu-system-x86_64 -kernel kernel.elf

dump:
	objdump -C -d -mi386:x86-64:intel kernel.elf

clean:
	rm -fr ../build/*
	rm -f *.o *.a *.cmi *.cmx *.elf *.depend
	rm -f arch/x86_64/*.o
	rm -f c-stubs/*.o 
