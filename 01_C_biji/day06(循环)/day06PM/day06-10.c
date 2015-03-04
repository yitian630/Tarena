/*
	while 循环
*/
#include <stdio.h>
int main(){
	int i = 0;//表达式1
	do{
		//循环体
		printf("HelloWorld!\n");
		//表达式3	
		i++;
	}while(i<10);//表达式2
	
	
	/*
	int i=10;//表达式1
	while(i<10){ //***表达式2 //关注条件
		printf("HelloWorld!\n");
		//表达式3
		i++;
	}
	*/
	/*
	int j;
	for(j=0;j<10;j++){//关注循环的次数
		printf("HelloWorld!\n");	
	}
	*/
	return 0;
}