/*
	取地址运算符& 与 寻址运算符*
*/
#include <stdio.h>
int main(){
	
	int i = 10;
	char c = 'a';
	//point 取地址&
	printf("i address:%p\n",&i);
	i = 20;
	// 寻址*
	printf("*&i->value :%d\n",*(&i));
	printf("*&c->value :%c\n",*(&c));
	return 0;
}