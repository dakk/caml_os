#include "types.h"
#include "caml/mlvalues.h"


#define VIDEO_COLS  80
#define VIDEO_LINES 25
#define VIDEO_SIZE 	VIDEO_COLS * VIDEO_LINES

static __u16 x_pos = 0;
static __u16 y_pos = 0; 
static __u16 attr = 0x1000 | 0x0e00;
__u16 *vidmem = (__u16 *) (KERNEL_VMA + 0x000b8000);


void put_char(value c) {
	vidmem[y_pos * VIDEO_COLS + x_pos] = ((__u8) Int_val(c)) | attr;
	x_pos ++;
	if (x_pos >= VIDEO_COLS) {
		x_pos = 0;
		y_pos ++;
	}
}

void skip_char (value c) {
	for(int i = 0; i < Int_val(c); i++)
		put_char(Val_int(' '));
}



void clear_screen() {
	for(int i = 0; i < VIDEO_SIZE; ++i) {
		vidmem[i] = ' ' | attr;
	}
}
