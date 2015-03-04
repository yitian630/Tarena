/*
使用循环特性重构 通过键盘输入四个数，
求四个数中的最大值、最小值、和。
*/
#include <stdio.h>
int main(){
	
	int i;
	int num = 0;
	int max;
	int min;
	/* 第一种赋初值的方式
	printf("请输入1个数\n");	
	scanf("%d",&num);
	max = num;//解决赋初值合理性
	*/
	//0 1 2 3 
	//第二种赋初值的方式
	max = -1;//赋一个合理的初值 
					//给真正的值一个机会去修改它
	min = 101;
	for(i = 0;i < 4;i++){
		printf("请输入%d个数\n",i+1);	
		scanf("%d",&num);
		if(num>max){
			max = num;	
		}
		if(num<min){
			min = num;	
		}
	}
	printf("max:%d min:%d\n",max,min);
	return 0;
}