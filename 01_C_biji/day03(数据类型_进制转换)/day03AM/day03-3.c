/*
	输入函数
*/
#include <stdio.h>
int main(){
	
	//1.声明
	char ch;
	
	//2.使用
	printf("请输入一个字符:\n");//提示数据输入
	scanf("%c",&ch);//注意，程序会发生等待
	
	//3.输出
	printf("ch:%c\n",ch);
	
	return 0;	
}