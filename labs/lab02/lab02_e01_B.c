#include <stdio.h>
#include <unistd.h>

int main() {
  int i;

  for (i = 3; i > 1; i--) {
    if (fork())
      printf("%d\n", i); // for parent
  }
  printf("%d\n", i);

  return 0;
}
