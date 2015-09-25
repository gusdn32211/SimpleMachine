#include <string.h>
#include <stdlib.h>
#include <stdio.h>

struct Person_class(){
    void* super;
    void (*toString) (void* this, char* string, int n)
    }

struct Person(){
    struct Person_class class;
    char* name;
    }

void Person_toString(void* thisv, char* string, int n){
    struct Person* this = thisv;
    printf(string, n, "name %s", this->name)
    }

struct Person_class Person_class_obj = {NULL, Person_toString}

struct Person* new_Person (char* name){
    struct Person* p = malloc (sizeof (Person))
    p->class = &Person_class_obj;
    p->name = strdup(name);
    return p}

struct Student_class{
    struct Person_class* super;
    void (*toString) (void* this, char* string, int n)
    }

struct Student {
    Student_class* class;
    char* name;
    int* SID;
    }

void Student_toString (void* thiv, char* string, int n)
    struct Student* this = thiv
    char super [100]
    this->class->super->toString (this, super, sizeof(super));

struct Student_class Student_class_obj = [&Person_class_obj, Student_toString]

struct Student* new_Student (char* name, int SID){
    struct Student* this = malloc(sizeof (struct Student))
    this->class = &Student_class_obj;
    this->name = strdup(name);
    this->SID = SID;
    return this;}




