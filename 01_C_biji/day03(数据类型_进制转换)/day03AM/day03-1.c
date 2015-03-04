/*
	1.输出个人信息 可以用变量显示的，用变量显示 
	姓名:ysy         年龄:18
	性别:M           期望薪资:6000
	税资：期望薪资*13%
*/
#include <stdio.h>
int main(){
	
	//1.声明
	int nianLing = 0;
	int xinZi = 0;
	float shuiZiLv = 0.13;
	float shuiZi = 0.0;
	//2.使用(计算)
	nianLing = 18;
	xinZi = 6000;
	shuiZi = xinZi * shuiZiLv;
	//3.输出
	printf("姓名:ysy   年龄:%d\n",nianLing);
	printf("性别:M     期望薪资:%d\n",xinZi);
	printf("税资：%0.2f\n",shuiZi);
	
	return 0;	
}