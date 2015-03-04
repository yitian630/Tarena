/*
	逻辑运算符中的短路
*/
#include <stdio.h>
int main(){
	
	int i = 10;
	//会发生短路与
	/*
	printf("i<0&&i=20:%d\n",i<0&&(i=20));
	
	printf("i>0&&i=20:%d\n",i>0&&(i=20));
	*/
	//会发生短路或
	printf("i>0||i=30:%d\n",i>0||(i=30));

	printf("i:%d\n",i);
	return 0;
}