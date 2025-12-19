#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

int main() {
    pid_t pid = fork();

    if (pid == -1) {
        perror("fork failed");
        return 1;
    } else if (pid == 0) {
        // Child process
        printf("I am the child. My PID is %d, my parent's PID is %d\n",
               getpid(), getppid());
    } else {
        // Parent process
        printf("I am the parent. My child's PID is %d, my PID is %d\n",
               pid, getpid());
    }

    return 0;
}
