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
  char name[1024];
  fs = fopen(argv[1], "r");
  fd = fopen(argv[2], "r");

  // sol1
  sprintf(name, "%s.1", argv[2]);
  while (fscanf(fs, "%c", &c)) {
    fprintf(fd, "%c", c);
  }
  fclose(fd);
  fclose(fs);
  return 0;
}
