#include <stdio.h>
int main(){
	int i;
	/* 第一题
	for(i=0;i<5;i++){
		printf("*");	
	}
	printf("\n");
	*/
	int j;
	/*
	for(i=0;i<5;i++){
		//怎么将行与列的关系 关联起来j<i+1
		for(j=0;j<i+1;j++){
			printf("*");
		}
		printf("\n");	
	}
	*/
	
	//9*9乘法表
	for(i=1;i<=9;i++){
		for(j=1;j<i+1;j++){
			printf("%d*%d=%d ",i,j,i*j);	
		}	
		printf("\n");
	}
	
	return 0;
}