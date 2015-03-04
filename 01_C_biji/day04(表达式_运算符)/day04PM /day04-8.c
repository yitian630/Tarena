/*
	逻辑表达式
*/
#include <stdio.h>
int main(){
	
	int i = 10;
	int j = 11;
	printf("i>j:%d\n",i>j);//0
	printf("10>11:%d\n",10>11);//0
	
	//逻辑与&&表达式 两个表达式都为真 结果为真
	printf("(i>j)&&(10>11):%d\n",
		(i>j)&&(10>11));
	printf("(i<j)&&(10<11):%d\n",
		(i<j)&&(10<11));
		
		//逻辑或||表达式 两个表达式只要其一为真 
		//结果为真
		//1||0
	printf("(i<j)||(10>11):%d\n",
		(i<j)||(10>11));
		//0||1
	printf("(i>j)||(10<11):%d\n",
		(i>j)||(10<11));
	//逻辑非!
	printf("i>j:%d\n",i>j);//0
	printf("!(i>j):%d\n",!(i>j));//1
	printf("!(i<j):%d\n",!(i<j));//0
	
	return 0;
}