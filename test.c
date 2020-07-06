#include <stdio.h>
#include <jemalloc/jemalloc.h>

int main() {
    char *p = (char*)je_malloc(20);
    p[0] = 'H';
    p[1] = 'e';
    p[2] = '\0';
    printf("p = %s\n", p);
    je_free(p);
    return 0;
}
