#ifndef C_STUBS_MEM_H
#define C_STUBS_MEM_H

#include <types.h>
#include "caml/mlvalues.h"

/** returns a pointer to the vma address + offset */
value _mem_get(value i);

#endif