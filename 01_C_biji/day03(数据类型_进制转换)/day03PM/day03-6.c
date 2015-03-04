/*
	取值范围
*/
#include <stdio.h>
int main(){
	//无符号 取值范围0~255
	unsigned char ch1 = 300;
	//有符号 取值范围-128~0~127
	char ch2 = 127;
	char ch3 = ch2+1;//数据溢出
	
	char ch4 = -128;
	char ch5 = -128-1;//数据溢出
	printf("ch1:%d\n",ch1);
	printf("ch2:%d\n",ch2);
	printf("ch3:%d\n",ch3);
	printf("ch5:%d\n",ch5);
	return 0;	
}
