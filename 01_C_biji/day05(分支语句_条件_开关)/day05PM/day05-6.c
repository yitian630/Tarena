/*
把上面第2题优化一下，根据分数级别，
判断分数范围。’A’
*/
#include <stdio.h>
int main(){
	
	//声明
	char ch;
	
	//使用
	printf("请输入一个字符:\n");
	scanf("%c",&ch);
	
	if(ch=='a'||ch=='A'){
		printf("你输入级别相应的成绩范围为:100~90分\n");	
	}else if(ch=='b'||ch=='B'){
		printf("你输入级别相应的成绩范围为:89~80分\n");		
	}else if(ch=='c'||ch=='C'){
		printf("你输入级别相应的成绩范围为:79~60分\n");		
	}else if(ch=='d'||ch=='D'){
		printf("你输入级别相应的成绩范围为:59~0分\n");		
	}else{
		printf("你输入的数据不正确!\n");	
	}
	
	
	return 0;
}