/*
	sizeof() 
*/
#include <stdio.h>
int main(){
	int i = 10;
	char c = 'a';
	float f = 10.1f;
	
	printf("i size:%ld\n",
		sizeof(i));
	printf("int size:%ld\n",
		sizeof(int));
	printf("10 size:%ld\n",
		sizeof(10));
	printf("i=20 size:%ld\n",
		sizeof(i=20));
	printf("i:%d\n",i);
	printf("char size:%ld\n",sizeof(c));
	
	
	return 0;
}