#include "cmem.h"
#include <caml/memory.h>

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
