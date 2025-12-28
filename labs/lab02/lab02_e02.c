// A program receives two integer values ​​on the command line, 
// called n and t. The program (parent process) must produce 2 children and terminate.
// In turn, each child must produce 2 children and terminate. 
// This sequence of operations must continue until 2 ^ n processes 
// on the leaves of the tree are produced/running. The leaf processes 
// wait for t seconds and display (on screen) a termination message.
// Note that each process (in the tree) produces two other processes.
// Only those on the leaves of the tree sleep and display a message. 
// What is the order of termination of the processes? Is it always the same? 
// How can they be recognized (ppid)?
//
// Once the program has been executed:
//
//     look for the pid of the various processes with the command ps
//         from the same shell
//         from another shell
//     terminate the execution of some processes with the kill command executed
//         from the same shel
//         from another shell
//
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, int *argv[]){
  int counter=0;
  int n = atoi(argv[1]);
  int t = atoi(argv[2]);
  pid_t pid1;
  pid_t pid2;


  for (int i=0; i<n; i++ ){
    pid1 = fork();
    
    if (pid1==0){

    }

  }
  return 0;
}
