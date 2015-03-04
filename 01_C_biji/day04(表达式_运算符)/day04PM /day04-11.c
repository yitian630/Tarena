/*
	类型升级
*/
#include <stdio.h>
int main(){
	//自动升级
	int i = 10;
	float f = 10.1f;
	printf("i+f:%lf\n",i+f);
	//自动升级
	float f2 = 10;
	printf("f2:%f\n",f2);
	//强制类型转换 在C语言中 是不报警告，有风险
	//应该使用强制类型转换提示一下
	
	int i2 = 200;
	char ch = (char)i2;
	printf("ch:%d\n",ch);
	printf("i2:%d\n",i2);
	return 0;
}