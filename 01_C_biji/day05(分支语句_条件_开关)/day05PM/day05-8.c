/*
	5.判断闰年，平年2月份28天，闰年2月份29天。
	条件两个：
		a.年份可以同时整除4并且不能整除100
			(year%4==0) && (!(year%100==0))
		b.整除400
			year%400==0
*/
#include <stdio.h>
int main(){
	
	//声明
	int year = 0;
	
	//使用
	printf("请输入年份:\n");
	scanf("%d",&year);
	
	if((year%4==0) && (!(year%100==0)) 
		|| 
		(year%400==0)){
		printf("您输入的年份是闰年\n");
	}else{
		printf("您输入的年份是平年\n");
	}
	
	printf("您输入的年:%d 是%d天.\n",
		year,365+((year%4==0) && (!(year%100==0)) 
		|| 
		(year%400==0)));
		
		
	/*
	输入年、月，求某月有多少天，
	31、30、29、28
	1 3 5 7 8 10 12 31天
	4 6 9 11 30天
	2 28天 29天 
	*/
	int year2=0,month=0;
	
	printf("请输入年信息:\n");
	scanf("%d",&year2);
	printf("请输入月信息:\n");
	scanf("%d",&month);
	
	if(month==4||month==6||month==9||month==11){
		printf("您输入的%d年%d月有%d天\n",
			year2,month,30);	
	}else if(month==2){
		printf("您输入的%d年%d月有%d天\n",
			year2,month,28+((year2%4==0) && (!(year%100==0)) 
		|| 
		(year2%400==0)));	
	}else{
		printf("您输入的%d年%d月有%d天\n",
			year2,month,31);
	}
	
	return 0;
}