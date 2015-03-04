/*
	通过键盘输入四个数，
	求四个数中的最大值、最小值、和。
*/
#include <stdio.h>
int main(){
	int num1=0,num2=0,num3=0,num4=0;
	int max;//最大值
	int min;//最小值
	int sum=0;//和
	
	printf("请输入第1个数:\n");
	scanf("%d",&num1);
	printf("请输入第2个数:\n");
	scanf("%d",&num2);
	printf("请输入第3个数:\n");
	scanf("%d",&num3);
	printf("请输入第4个数:\n");
	scanf("%d",&num4);
	
	//给最大值 最小值一个初值
	max = num1;
	min = num1;
	
	if(num2>max){
		max = num2;	
	}
	
	if(num2<min){
		min = num2;	
	}
	
	if(num3>max){
		max = num3;	
	}
	
	if(num3<min){
		min = num3;	
	}
	
	if(num4>max){
		max = num4;	
	}
	
	if(num4<min){
		min = num4;	
	}
	
	//求和 1 2 3 4
	sum+=num1;//累加 sum=sum+num ;
						//1 = 0 + 1;
	sum+=num2;//3 1+2
	sum+=num3;//6 3+3
	sum+=num4;//10  6+4
	
	printf("max:%d min:%d\n",max,min);
	printf("sum:%d\n",sum);
	return 0;	
}