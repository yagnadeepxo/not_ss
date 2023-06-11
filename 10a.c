#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<unistd.h>

void main(){
    pid_t child_pid;
    child_pid = fork();
    if(child_pid>0){
        printf("this is a parent process: %d, sleep for a minute\n",getpid());
        sleep(60);
    }
    else{
        printf("this is a child process: %d, exit immedialtely", getpid());
        exit(0);
    }
    system("ps -e -o pid,ppid,stat,comm");
}