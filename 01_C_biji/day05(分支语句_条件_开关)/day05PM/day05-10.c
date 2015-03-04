/*
	switch开关分支
*/
#include <stdio.h>
int main(){
	int i = 2;
	char ch = 'A';
	//开关分支语句
	switch(i){//i 为控制表达式 
		case 3:printf("三\n");break;
		case 1:printf("一\n");break;
		default:printf("您输入的数据有误!\n");break;
		case 2:printf("二\n");break;
	}
	/*
	switch(ch){//i 为控制表达式 
		case 'a':printf("一\n");break;
		case 'b':printf("二\n");break;
		case 'c':printf("三\n");break;
		default:printf("您输入的数据有误!\n");break;
	}
	*/
	
	
	return 0;
}