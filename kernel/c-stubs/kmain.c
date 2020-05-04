#include "libc-dummy.h"
#include <arch/i686/multiboot.h>

extern void camlKmain__entry(void);
extern void caml_startup(char **args);
extern void caml_startup_aux(char **args);
extern void caml_startup_common(char **args, int pooling);
extern void caml_main(char **args);

extern void _begin, _ro_end, _end, __bss_start, __bss_end;

void setup_memory(void *start, void *end)
{
	int s = sizeof(void *);
	/* Total available space */
	int size = (end - start) - 7 * s;
#ifdef DEBUG
	c_printf("size: %d\n", size);
#endif

	*(void **)start = (start + 4 * s);
	*(void **)(start + s) = 0;
	*(void **)(start + 2 * s) = end;
	*(int *)(start + 3 * s) = size;
	*(void **)(end - 3 * s) = (start + 4);
	*(void **)(end - 2 * s) = NULL;
	*(int *)(end - s) = 0;
#ifdef DEBUG
	c_printf("start: %p (prev: %p, next: %p, size: %d)\n", start + 4, *(void **)(start), *(void **)(start + 4), *(int *)(start + 8));
	c_printf("end: %p (prev: %p, next: %p, size: %d)\n", end, *(void **)(end - 12), *(void **)(end - 8), *(int *)(end - 4));
#endif
}

void kmain(unsigned long addr)
{
	unsigned long block_size = 1 << 20;
	struct multiboot_info *mbi;
	struct memory_map *mmap;
	unsigned long mmap_size;

	mbi = (struct multiboot_info *)addr;
	mmap = (struct memory_map *)mbi->mmap_addr;
	mmap_size = mbi->mmap_length;

	while (mmap_size > 0)
	{
		if ((void *)mmap->base_addr == &_begin)
		{
			block_size = mmap->length;
			break;
		}
		mmap_size -= sizeof(*mmap);
		mmap++;
	}
	if (&_begin + block_size < &__bss_end)
	{
		//   c_printf("not enough memory for funk: %lu upper memory needed",&__bss_end-&_begin);
		while (1);
	}

	// __asm__ __volatile__("cli");
	static char *argv[] = {"ocaml", NULL};
	memset(&__bss_start, 0, &__bss_end - &__bss_start);
	__asm__ __volatile__(""
						 :
						 :
						 : "memory");

	heap = &_end;
	heaplimit = &_begin + block_size;
	last_seen = &_end + 2 + 4 * sizeof(void *);

	// setup_memory(heap + HEAP_OFFSET, heaplimit);
	caml_startup(argv);
	camlKmain__entry();
}