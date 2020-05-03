#include "types.h"
#include "caml/mlvalues.h"


#define VIDEO_COLS  80
#define VIDEO_LINES 25
#define VIDEO_SIZE 	VIDEO_COLS * VIDEO_LINES

// static __u16 x_pos = 0;
// static __u16 y_pos = 0; 
static __u16 attr = 0x1000 | 0x0e00;
__u16 *vidmem = (__u16 *) (0xB8000);


// void put_char(value c) {
// 	vidmem[y_pos * VIDEO_COLS + x_pos] = ((__u8) Int_val(c)) | attr;
// 	x_pos ++;
// 	if (x_pos >= VIDEO_COLS) {
// 		x_pos = 0;
// 		y_pos ++;
// 	}
// }


void clear_screen() {
	for(int i = 0; i < VIDEO_SIZE; ++i) {
		vidmem[i] = ' ' | attr;
	}
}


extern void camlKmain__entry();

void kmain () {
	camlKmain__entry();
}