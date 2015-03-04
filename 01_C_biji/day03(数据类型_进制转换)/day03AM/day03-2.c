/*
	字符型变量
*/
#include <stdio.h>
int main(){
	
	//1.声明 字符型变量
	char ch;
	char ch2;
	char ch3;
	char ch4;
	//2.使用 给符型变量赋值
	ch = 'a';
	ch2 = 'A';//65	
	ch3 = '5';
	//ch4 = 'a';
	//通过键盘输入数据
	printf("请输入小写字母:\n");
	scanf("%c",&ch4);
	//3.输出 字符型变量
	printf("ch value:%d\n",ch);
	printf("ch character:%c\n",ch);
	
	printf("ch2+4 value:%d\n",ch2+4);//69
	printf("ch2+4 character:%c\n",ch2+4);//E
	printf("ch3 char:%c->int:%d\n",ch3,ch3-'0');
	printf("%c->%c\n",ch4,ch4-('a'-'A'));
	return 0;	
}