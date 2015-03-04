/*
	复合赋值运算符
*/
#include <stdio.h>
int main(){
	
	int i = 10;
	//i = i + 5;
	i+=5;//复合赋值运算符
	i-=5;//i=i-5;
	i*=5;//i=i*5;
	i/=5;//i=i/5;
	i%=5;//i=i%5;
	printf("i:%d\n",i);
	
	return 0;
}