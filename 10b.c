#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/types.h>
//#include<sys/wait.h>
int main(){
    pid_t p1, p2;
    if((p1 = fork())<0){
        printf("error");
    }
    else if(p1 == 0){
         printf("first child with process ID : %d", getpid());
         p2 = fork();
         if(p2 > 0){
            exit(0);
         }
         else{
            printf("second child with process ID :%d, with parent process ID: %d", getpid(),getppid());
            exit(0);
         }
    }
}
