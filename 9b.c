#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
    int ch, rv;
    char cmd[10];
    rv = fork();
    if (rv == 0) {
        do {
            printf("\nEnter the command: ");
            scanf("%s", cmd);
            system(cmd);
            printf("\n1: continue\n0: exit\n");
            scanf("%d", &ch);
        } while (ch != 0);
    } else {
        wait(NULL);
        printf("\nChild terminated\n");
    }
    return 0;
}
