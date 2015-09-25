#include <stdlib.h>
#include <stdio.h>

struct Person_class {
	void* super;
	void (*toString) ();
};

struct Person {
  struct Person_class* class;
  	char* name;
};

struct Person_class Person_class_obj = {NULL, Person_toString};

 void Person_toString(void* this) {
    return "Name: " .concat (this->name);
  }

struct Person* new_Person(char* name){
	struct Person* p = malloc (sizeof (struct Person));
	p->class = &Person_class_obj;
	p->name = strdup(name);
	return p;
}

struct Student_class{
	struct Person_class* super;
	public (*toString)();

};

struct Student{
	struct Student_class* class;
	char* name;
	Integer sid;
};

struct Student_class Student_class_obj = {&Person_class_obj, Student_toString};


public Student_toString(void* this,) {
	  struct Student* this = this;
    return this->class->super->toString(this).concat (", SID: ") .concat (this->sid.toString());
  }

 struct Student* new_Student (Char* name, Integer sid){
 struct Student* s = malloc (sizeof (struct Student));
 s->class = &Student_class_obj;
 s->name = strdup(name);
 s->sid = sid;
 return s;
 }

struct A6_2{
	
	static (*print) (struct Person* p);
	void (*main) (char** args);
}

static print (struct Person* p){
	printf ("%s\n", p.toString());
}

void main(char** args)
{
	char** people = new_Person("Alex"), new_Student("Alice", 300);
	for(Person p: people){
		print(p);
	}
}