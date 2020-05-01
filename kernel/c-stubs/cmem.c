#include "cmem.h"

value _mem_get(value i) {
	__u64 addr = Int_val (i);
	__u8* ptr = addr;
	Bytes_val(ptr);
}

value _mem_get_vma(value offset) {
	return _mem_get(KERNEL_VMA + Int_val (offset));
}

void _mem_isetb(value i, value c) {
	__u64 addr = KERNEL_VMA + 0x000b8000 + Int_val (i);
	__u8* ptr = addr;
	ptr[0] = Int_val(c); 
}

void _mem_isetw(value i, value c) {
	__u64 addr = Int_val (i);
	__u32* ptr = addr;
	ptr[0] = Int_val(c); 
}


void _mem_setb(value m, value offset, value c) {
	__u8* ptr = String_val(m);
	ptr[Int_val(offset)] = Int_val(c); 
}

void _mem_setw(value m, value offset, value c) {
	__u64* ptr = String_val(m);
	ptr[Int_val(offset)] = Int_val(c); 
}