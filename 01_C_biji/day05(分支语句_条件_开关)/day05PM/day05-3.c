/*
	条件分支语句
*/
#include <stdio.h>
int main(){
	
	int num = -5;
	//条件分支语句
	
	if(num>0){
		printf("您输入的数是正数:\n");
		if(num>100){
			printf("num>100\n");	
		}else{
			printf("num<=100");	
		}	
	}else if(num>1)
		printf("您输入的数是负数:\n");	
	
	
	
	return 0;
}