#include <stdio.h>
#include <math.c>

int main(int argc, char *argv[])
{
  int arg=atio(argv[1]);
  printf("cos(%d)=%0.8f\n", arg, cos(arg));
  printf("sin(%d)=%0.8f\n", arg, sin(arg));
  printf("tan(%d)=%0.8f\n", arg, tan(arg));
  return 0;
}
