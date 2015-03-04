/*
	逗号表达式,
*/
#include <stdio.h>
int main(){
	int i = 0,j = 0;//分隔符
	int k = 0;
	int r = 0;
	r = (i=3,j=4,k=5);//逗号表达式
	printf("r:%d\n",r);
	
	return 0;
}