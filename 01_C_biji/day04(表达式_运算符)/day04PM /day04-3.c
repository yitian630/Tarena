/*
	算术运算符
*/
#include <stdio.h>
int main(){
	int i = 25;
	int j = 10;
	int i2 = 4/3;
	int i3 = 4/-3;
	printf("i/j:%d\n",i/j);//求商
	printf("i%%j:%d\n",i%j);//求余
	printf("4/3:%d\n",i2);
	printf("4/-3:%d\n",i3);
	printf("-4%%3:%d\n",-4%3);
	printf("4%%-3:%d\n",4%-3);
	printf("-4%%-3:%d\n",-4%-3);
	return 0;
}