#include <stdio.h>
int main(){
	//单行注释
	/*
		多行注释
	*/
	
	//变量的声明
	int number1=0;//初始化
	int number2=0;
	
	float f = 0.0;
	
	//变量的赋值
	number1 = 10;
	number2 = 20;
	f = 2.5;
	//变量的值可以改变
	//number1 = 20;
	
	//输出变量的值 %d占位符 对应 number1的值
	//printf("number1:%d\n", number1);
	//printf("number2:%d\n", number2);
	printf("n1:%d + n2:%d = %d\n",
		number1,
		number2,
		number1+number2);
	printf("n1*f=%.2f\n",number1*f);
	return 0;
}