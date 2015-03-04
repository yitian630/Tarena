/*
	条件运算符、多目运算符
*/
#include <stdio.h>
int main(){
	int i = 10;
	int j = 20;
	int k = 0;
	char c ;
	//k = i<j?3:5; //条件表达式
	c = i>j?'Y':'N';
	//printf("k:%d\n",k);
	printf("c:%c\n",c);
	
	/*
		练习：在键盘上输入一个字母，
		将小写转换大写，如果是大写字母原样输出。
		(重构)
	*/
	char ch;
	char ch2;
	printf("请输入一个字符:\n");
	scanf("%c",&ch);
	
	//ch2 = ch>='a'&&ch<='z'?ch-('a'-'A'):ch;		
	
	
	ch2 = (ch>='a'&&ch<='z')?(ch-('a'-'A')):(ch);
	printf("%c->%c\n",ch,ch2);
	return 0;
}