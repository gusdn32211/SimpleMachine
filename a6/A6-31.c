//
// THIS IS THE SOLUTION TO ASSIGNMENT CPSC 213 6.
// Do not share this code with anyone outside of class.
//
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include "list.h"

void printString (void* sv) {
  char* s = sv;
  printf ("%s\n", s? s : "NULL");
}

void printInt (void* iv) {
  intptr_t i = (intptr_t) iv;
  printf ("%ld\n", i);
}

void nullIfNegative (void** rpv, void* sv, void* iv) {
  char** rp  = (char**) rpv;
  char*  s   = sv;
  intptr_t i = (intptr_t) iv;
  *rp = i<0? s : 0;
}

int isNotNegative (void* iv) {
  intptr_t i = (intptr_t) iv;
  return i >= 0;
}

int isNotNull (void* s) {
  return s != NULL;
}

void truncate (void** rpv, void* sv, void* iv) {
  char** rp  = (char**) rpv;
  char*  s   = sv;
  intptr_t i = (intptr_t) iv;
  *rp        = strdup (s);
  if (strlen (*rp) > i)
    (*rp) [i] = 0;
}

void intValue (void** rpv, void* av) {
  intptr_t* rp = (intptr_t*) rpv;
  char*     a  = av;
  char* ep;
  *rp = strtol (a, &ep, 0);
  if (*ep)
    *rp = -1;
}

void max (void** rpv, void* av, void* bv) {
  intptr_t* rp = (intptr_t*) rpv;
  intptr_t  a  = (intptr_t)  av;
  intptr_t  b  = (intptr_t)  bv;
  *rp = (a>b)? a : b;
}

int main (int argc, char** argv) {

  list_t l0 = list_create();
  for (int i=1; i<argc; i++)
    list_append (l0, argv [i]);
  
  list_t l1 = list_create();
  list_map1 (intValue, l1, l0);
  
  list_t l2 = list_create();
  list_map2 (nullIfNegative, l2, l0, l1);
  
  list_t l3 = list_create();
  list_filter (isNotNegative, l3, l1);
  
  list_t l4 = list_create();
  list_filter (isNotNull, l4, l2);

  list_t l5 = list_create();
  list_map2 (truncate, l5, l4, l3);
  
  list_foreach (printString, l5);
  list_foreach (free, l5);
  
  intptr_t v = -1;
  list_foldl (max, (void**) &v, l3);
  printf ("%ld\n", v);
  
  list_destroy (l0);
  list_destroy (l1);
  list_destroy (l2);
  list_destroy (l3);
  list_destroy (l4);
  list_destroy (l5);
}