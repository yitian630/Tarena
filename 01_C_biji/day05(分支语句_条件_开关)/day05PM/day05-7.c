/*
	准备回家，交通工具，
	通过键盘输入你的工资，
	如果工资小于1300(最低工资)，
	则显示输入错误，工资大于10000，
	就坐飞机，如果大于5000就坐火车，
	大于3000就坐汽车，大于1500就骑自行车，
	都不满足步行。
*/
#include <stdio.h>
int main(){
	//声明
	float salary;
	
	//使用
	printf("请输入您的工资:\n");
	scanf("%f",&salary);
	
	//根据工资判断所要出行的交通工具
	if(salary<1300){
		printf("您输入的工资有误.");	
	}else if(salary>=10000){
		printf("就坐飞机回家\n");
	}else if(salary>=5000){
		printf("就坐火车回家\n");	
	}else if(salary>=3000){
		printf("就坐汽车回家\n");	
	}else if(salary>=1500){
		printf("就骑自行车回\n");
	}else{//salary>=1300&&salary<1500
		printf("就走步回家.");
	}
	
	return 0;
}