/*
	如果输入小写字母转成大写
	如果输入大写字母转成小写，
	即不是大小也不是小写，显示输入数据不正确。
*/
#include <stdio.h>
int main(){
	
	//声明
	char ch;
	
	//使用
	printf("请输入一个字母:\n");
	scanf("%c",&ch);
	
	if((ch>='a')&&(ch<='z')){
		printf("您输入的是小写字母:%c\n",ch);
		printf("%c->%c\n",
			ch,ch-('a'-'A'));
	}else if(ch>='A'&&ch<='Z'){
		printf("您输入的是大写字母:%c\n",ch);
		printf("%c->%c\n",
			ch,ch+('a'-'A'));	
	}else{
		printf("您输入的数据不正确!\n");
	}
	
	return 0;
}