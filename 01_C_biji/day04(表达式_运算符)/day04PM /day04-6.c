/*
 自增、减运算符
*/
#include <stdio.h>
int main(){

	int i = 10;
	int j = 0;
	//i++;//i=i+1; 每次自增1
	//i++;
	//i--;//i=i-1;每次自减1
	//i--;
	//j = ++i;//先自增 后运算(赋值)
	//j = i++;//先运算(赋值) 后自增
	j = ++i + ++i + i++;//
	printf("i:%d\n",i);
	printf("j:%d\n",j);
	return 0;
}