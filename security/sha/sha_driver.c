/* NIST Secure Hash Algorithm */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include "sha.h"
#ifdef GEM5
#include <gem5/m5ops.h>
#endif

int main(int argc, char **argv)
{
  FILE *fin;
  SHA_INFO sha_info;

  if (argc < 2) {
    fin = stdin;
    sha_stream(&sha_info, fin);
    sha_print(&sha_info);
  }
  else {
    while (--argc) {
    fin = fopen(*(++argv), "rb");
    if (fin == NULL) {
      printf("error opening %s for reading\n", *argv);
    }
    else {
#ifdef GEM5
      m5_begin_profile();
#endif
      sha_stream(&sha_info, fin);
      sha_print(&sha_info);
      fclose(fin);
      }
    }
  }
  return(0);
}
