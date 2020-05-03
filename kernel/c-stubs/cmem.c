#include "cmem.h"
#include <caml/memory.h>
#include "libc-dummy.h"

CAMLprim value _mem_get(value addr)
{
  CAMLparam1(addr);
  CAMLreturn(addr);
}

CAMLprim value _mem_get_vma(value offset)
{
  CAMLparam1(offset);
  CAMLreturn(KERNEL_VMA + Int_val(offset));
}

CAMLprim value _mem_malloc(value size) {
  CAMLparam1(size);
  CAMLreturn((char *) malloc(Int_val(size)));
}