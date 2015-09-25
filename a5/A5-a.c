int a[10];
int* x = a;
int ping(int a0, int a1){
	x[a1] = x[a1] + a0;
	return x[a1];
}

void foo(){
	int a = 1;
	int b = 2;
	ping(3,4);
	ping(a,b);
}