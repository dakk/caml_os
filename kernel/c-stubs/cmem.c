#include "cmem.h"
#include <caml/memory.h>
#include "libc-dummy.h"

CAMLprim value _mem_get(value addr)
{
  CAMLparam1(addr);
  CAMLreturn((char *) Int_val(addr));
}

CAMLprim value _mem_malloc(value size) {
  CAMLparam1(size);
  CAMLreturn((char *) malloc(Int_val(size)));
}