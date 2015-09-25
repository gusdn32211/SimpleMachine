//
// THIS IS THE SOLUTION TO ASSIGNMENT CPSC 213 6.
// Do not share this code with anyone outside of class.
//

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

/*
 * class Person {
 *    String toString { ... }
 * }
 */

struct Person_class {
  void* super;
  void  (*toString) (void* this, char* buf, int bufSize);
};

struct Person {
  struct Person_class* class;
  char*                name;
};

void Person_toString (void* thisv, char* buf, int bufSize) {
  struct Person* this = thisv;
  snprintf (buf, bufSize, "name: %s", this->name);
}

struct Person_class Person_class_obj = {NULL, Person_toString};

struct Person* new_Person (char* name) {
  struct Person* this = malloc (sizeof (struct Person));
  this->class = &Person_class_obj;
  this->name  = strdup (name);
  return this;
}

/*
 * class Student extends Person {
 *    String toString { ... }
 * }
 */

struct Student_class {
  struct Person_class* super;
  void  (*toString) (void* this, char* buf, int bufSize);
};

struct Student {
  struct Student_class* class;
  char*                 name;
  int                   sid;
};

void Student_toString (void* thisv, char* buf, int bufSize) {
  struct Student* this = thisv;
  char super [100];
  this->class->super->toString (this, super, sizeof (super));
  snprintf (buf, bufSize, "%s, SID: %d", super, this->sid);
};

struct Student_class Student_class_obj = {&Person_class_obj, Student_toString};

struct Student* new_Student (char* name, int sid) {
  struct Student* this = malloc (sizeof (struct Student));
  this->class = &Student_class_obj;
  this->name  = strdup (name);
  this->sid   = sid;
  return this;
}

/*
 * RUN
 */

void run() {
  char           str [1000];
  struct Person* people[] = {new_Person ("Alex"),
                             (struct Person*) new_Student ("Alice", 300)};
  
  for (int i = 0; i < sizeof (people) / sizeof (people[0]); i++) {
    people [i] ->class ->toString (people [i], str, sizeof (str));
    printf ("%s\n", str);
  }
}

//int main (int argc, char** argv) {
//  run();
//}