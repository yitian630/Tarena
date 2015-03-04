/*
从键盘上输入两个数，分别求出和、差、积、商。
*/
#include <stdio.h>
int main(){
	
	//声明
	int num1 = 0;
	int num2 = 0;
	
	//使用
	printf("请输入第一个数:\n");
	scanf("%d",&num1);
	printf("请输入第二个数:\n");
	scanf("%d",&num2);
	
	//输出
	printf("%d+%d=%d\n",
		num1,num2,num1+num2);
	printf("%d-%d=%d\n",
		num1,num2,num1-num2);
	printf("%d*%d=%d\n",
		num1,num2,num1*num2);
	printf("%d/%d=%d\n",
		num1,num2,num1/num2);
	
	return 0;	
}