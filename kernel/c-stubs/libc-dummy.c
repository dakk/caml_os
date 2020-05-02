#include <types.h>

char *heap;

char* malloc (size_t size) {
	// char *res = heap;
	// heap = heap + size;
	// return res;
}


void *realloc(void *ptr, size_t size) {
	// return malloc(size);
}

void free (char *m) { }

void *memcpy(char *a , const char *b, size_t dim) {
	// __u32 x = 0;
	
	// while(x < dim) {
	// 	*a = *b;
	// 	a++; 
	// 	b++;
	// 	x++;
	// }
	// return (void *) a;
}

void *memset(void *s, int c, size_t n) {
	// char *a = s;
	// size_t i;
	
	// for (i = 0; i < n; i++, a++)
	// 	*a = c;
	
	// return s;
}

void *memmove(char *a, char *b, size_t dim) {
	// size_t i;
	// for(i = 0; i < dim; i++) {
	// 	*b = *a;
	// 	a++;
	// 	b++;
	// }
	// return (void *) a;
}


int memcmp(const void *a, const void *b, size_t dim) {
	return 0;
}




char *stderr;
char *strerror;
char *__errno_location;

void __stack_chk_fail () {}
void floor() {}
void ceil() {}
void strcmp () {}
void strlen () {}
void __isoc99_sscanf () {}
void fputs () {}
void fprintf () {}
void fwrite () {}
void snprintf () {}
void fputc () {}
void fmin () {}
void log1p() {}
void closedir() {}
void close() {}
void atan() {}
void atan2() {}
void tan() {}
void sin() {}
void lseek64() {}
void dlsym() {}
void dlclose() {}
void expm1() {}
void hypot() {}
void readdir64() {}
void nextafter () {}
void round () {}
void sigaltstack() {}
void unlink() {}
void exit () {}
void mmap64() {}
void munmap() {}
void vfprintf() {}
void fflush () {}
void abort() {}
void getrlimit64() {}
void sigemptyset() {}
void sigaction () {}
void sigaddset() {}
void sigismember() {}
void sigdelset() {}
void sigprocmask() {}
void __sigsetjmp() {}
void open64() {}
void __xstat64() {}
void log10() {}
void readlink() {}
void uselocale() {}
void exp() {}
void ldexp() {}
void fma() {}
void acos () {}
void asin(){}
void tanh() {}
void cosh() {}
void cos() {}
void sinh() {}
void pow() {}
void sqrt() {}
void modf() {}
void log() {}
void isatty() {}
void read() {}
void write() {}
void getenv() {}
void opendir() {}
void ioctl() {}
void dlopen() {}
void secure_getenv() {}
void newlocale() {}
void freelocale() {}
void fmod() {}
void frexp() {}
void strtol() {}
void strtod_l() {}
void dlerror() {}
void getpid() {}
void getppid() {}
void system() {}
void getrusage() {}
void gettimeofday() {}
void getcwd() {}
void chdir() {}
void rename() {}
void vsnprintf() {}