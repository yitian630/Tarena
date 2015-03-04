/*
 转义符
*/
#include <stdio.h>
int main(){
	
	//声明
	char ch;
	
	//使用
	ch = '\\';
	
	//输出
	printf("ch:%c\n",ch);
	printf("ch:\"\n");
	printf("1 2345678\n");
	printf("1\t2345678\n");
	printf("%% \n");
	return 0;	
}