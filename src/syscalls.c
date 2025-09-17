
#include <sys/stat.h>
#include <sys/types.h>
#include <errno.h>
#include <unistd.h>

extern int errno;

int _write(int file, char *ptr, int len) {
    (void)file; (void)ptr; (void)len;
    return len;
}

int _read(int file, char *ptr, int len) {
    (void)file; (void)ptr; (void)len;
    return 0;
}

int _close(int file) {
    (void)file;
    return -1;
}

int _lseek(int file, int ptr, int dir) {
    (void)file; (void)ptr; (void)dir;
    return -1;
}

void _exit(int status) {
    (void)status;
    while (1) {}
}

int _sbrk(int incr) {
    extern char _end;
    static char *heap_end;
    char *prev_heap_end;

    if (heap_end == 0) {
        heap_end = &_end;
    }
    prev_heap_end = heap_end;
    heap_end += incr;
    return (int)prev_heap_end;
}
