#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<string.h>
#include<fcntl.h>
#include<sys/types.h>
#include<sys/stat.h>

int main(int argc, char *argv[]){
    int fd, num1, num2;
    char buf[20];

    if(argc==3){
        mkfifo(argv[1],0666);
        fd = open(argv[1],O_WRONLY);
        num1 = write(fd, argv[2], strlen(argv[2]));
        printf("\n number of bytes written is %d", num1);
        close(fd);
    }

    if(argc == 2){
        fd = open(argv[1],O_RDONLY);
        num2 = read(fd, buf, sizeof(buf)-1);
        buf[num2] = '\0';
        printf("The message size %d read is: %s\n", num2, buf);
        close(fd);
    }

    unlink(argv[1]);
    return 0;
}

