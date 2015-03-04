/*
输入一个成绩，得到评价，
						成绩>90 优
						成绩<60 不及格
						其它成绩 一般

*/
#include <stdio.h>
int main(){
	
	int num = 0;
	//输入一个成绩
	printf("请输入一个成绩:\n");
	scanf("%d",&num);
	
	//条件分支语句
	if(num>90){
		printf("您输入的分数是优秀:\n");	
	}else if(num<60){
		printf("您输入的分数是不及格:\n");	
	}else{
		printf("您输入的分数是一般:\n");	
	}
	
	return 0;
}