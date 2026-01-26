#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
// Write a program in C using the pthread library that creates two threads TA
// and TB. Thread TA generates a random number equal to 1 or 2; in the first
// case, it runs one instance of TB; in the second one, it runs two instances of
// TB. Thread TB does the same but runs 1 or 2 instances of TA. The program must
// stop when either 10 instances of thread TA or 10 instances of TB have been
// created (globally). To extract a random number, you can use the following
// function.
// // Random number generator helper function
int generate_random(int lower, int upper) {
  return (rand() % (upper - lower + 1)) + lower;
}
