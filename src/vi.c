#include <unistd.h>
#include <stdio.h>
#include <ctype.h>

#include "raw.h"

int main(void) {
    int _return = 0;
    char c;

    enableRawMode();

    while (read(STDIN_FILENO, &c, 1) == 1) {
        if (c == 'q') {
            goto end;
        }

        if (!iscntrl(c)) {
            printf("%c\r\n", c);
        }
    }

    end:
        disableRawMode();
        return _return;
}
