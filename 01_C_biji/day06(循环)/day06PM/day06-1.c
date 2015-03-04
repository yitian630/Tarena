#include <stdio.h>
int main(){
	int i = 0;
	printf("请输入您的成绩：");
	scanf("%d",&i);
	switch(i/10){
		case 10:printf("成绩为A\n");break;
		case 9:printf("成绩为A\n");break;
		case 8:printf("成绩为B\n");break;	
		case 7:printf("成绩为C\n");break;
		case 6:printf("成绩为D\n");break;
		case 5:printf("成绩为E1\n");break;	
		case 4:printf("成绩为E2\n");break;
		case 3:printf("成绩为E3\n");break;
		case 2:printf("成绩为E4\n");break;	
		case 1:printf("成绩为E5\n");break;	
		case 0:printf("成绩为E6\n");break;
		default:printf("您输入的数据有误！\n");	
	}

	return 0;
}