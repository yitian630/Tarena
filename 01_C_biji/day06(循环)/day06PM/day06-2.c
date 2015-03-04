/*
	循环
*/
#include <stdio.h>
int main(){	
	//声明循环标识
	int i;
	//0 1 2 3 4 5 6 7 8 9 10
	//表达式1 循环的标识 表达式2 控制循环
	//表达式3 循环间的规律
	for(i=0;i<10;i++){
		//循环体
		printf("老师 我跑第%d圈了\n",i);
	}
	//输出10次HelloWorld!
	printf("程序结束.\n");
	return 0;	
}