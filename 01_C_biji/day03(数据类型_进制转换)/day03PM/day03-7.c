/*
	进制转换
*/
#include <stdio.h>
int main(){
	
	int i = 11;//默认 十进制 
	int i2 = 011;//八进制 
	int i3 = 0x11;//十六进制 
	
	//%d 转换成十进制数输出
	//%o 转换成八进制数输出
	//%x 转换成二进制数输出
	printf("i:%d i:%o i:%x\n",i,i,i);
	printf("i2:%d i2:%o i2:%x\n",i2,i2,i2);
	printf("i3:%d i3:%o i3:%x\n",i3,i3,i3);
	return 0;
}