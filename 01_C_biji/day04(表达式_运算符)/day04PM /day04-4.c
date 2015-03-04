/*
1.键盘输入一个秒数，输出XX小时XX分钟XX秒
			  3666秒  ->  1小时1分种6秒
			  小时 1 3666/3600 
			  分钟 1 (3666-1*3600)/60 || 3666%3600/60
			  秒 3666-1*3600-1*60 || 3666%60
*/
#include <stdio.h>
int main(){
	
	//声明
	int second = 0;
	
	//使用
	printf("请输入一个秒数:\n");
	scanf("%d",&second);
	
	//输出
	printf("second:%d\n",second);
	printf("%d小时 %d分钟 %d秒\n",
		second/3600,
		second%3600/60,
		second%60);
		
	/*
	输入一个数，固定长度是三位数，输入123，
	输出结果倒置：321
	*/
	
	//声明
	int number = 0;
	int i1=0,i2=0,i3=0;
	//使用
	printf("请输入一个数:\n");
	scanf("%d",&number);
	//123
	i1 = number/100;
	i2 = number%100/10;
	i3 = number%10;
	//输出
	printf("原来的三位数:%d%d%d\n",
		i1,i2,i3);
	printf("倒置后的三位数:%d%d%d\n",
		i3,i2,i1);
	
	return 0;
}