#include <pthread.h>
#include <stdio.h>
#include <unistd.h>

int myglobal = 0;

void *thread_func(void *arg) {
  int i, j;
  for (i = 0; i < 20; i++) {
    j = myglobal; // Read
    j = j + 1;    // Increment
    myglobal = j; // Write
    printf("t");
  }
  return NULL;
}

int main() {
  pthread_t tid;
  pthread_create(&tid, NULL, thread_func, NULL);

  for (int i = 0; i < 20; i++) {
    myglobal = myglobal + 1;
    printf("m");
    sleep(1);
  }

  pthread_join(tid, NULL);
  printf("Final: %d\n", myglobal); // Should be 40
  return 0;
}
