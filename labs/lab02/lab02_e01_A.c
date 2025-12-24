#include <stdio.h>
#include <unistd.h>

int main() {
  int i;

  for (i = 1; i <= 2; i++) {
    if (!fork())         // for child it returns 0 so true
      printf("%d\n", i); // child
  }
  printf("%d\n", i);

  return 0;
}
