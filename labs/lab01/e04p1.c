// Write a C language program that, using the ANSI C I/O primitives
// (fgetc/fputc, fscanf/fprint,fget/fputs of your choice), is able to copy a
// text file to an identical file.
// The name of the two files is received on the command line,
// so that the program can be executed using a command that
// specifies three parameters:
// nameExcutable sourceFile destinationFile
//
#include <stdio.h>

int main(int argc, char **argv) {
  FILE *fs, *fd;
  char c;
  // char name[1024];

  if (argc != 3) {
    printf("Usage ./ex04p1 <f1> <f2>");
    return 1;
  }

  fs = fopen(argv[1], "r");
  if (!fs) {
    printf("Error fs can't be opened");
    return 1;
  }

  fd = fopen(argv[2], "w");
  if (!fd) {
    printf("Error fd can't be opened");
    return 1;
  }

  // sol1
  while (fscanf(fs, "%c", &c) != EOF) {
    fprintf(fd, "%c", c);
  }
  // while ((c = fgetc(fs)) != EOF) {
  //   fputc(c, fd);
  // }
  fclose(fd);
  fclose(fs);
  return 0;
}
