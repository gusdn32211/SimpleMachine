int x[8] = {1, 2, 3, -1, -2, 0, 184, 340057058};
int y[8];

int f(int a0){
	int j = 0;

	while (a0 !=0){
			if(a0 & 0x80000000)
				j++;
				a0 = a0 << 1;					
	}
	return a0;
}

void main(){
	int i = 8;
	while (i != 0){
	i--;
	y[i] = f(x[i]);
	}
}