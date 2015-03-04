/*
	输入函数
*/
#include <stdio.h>
int main(){
	
	//1.声明
	char ch;
	char ch2;
	int i;
	//2.使用
	printf("请输入一个字符:\n");//提示数据输入
	scanf("%c",&ch);//注意，程序会发生等待
	
	//清空缓冲区 回车也是字符
	//scanf("%*c");
	
	//printf("请输入第二个字符:\n");
	//scanf("%c",&ch2);
	
	printf("请输入一个整数:\n");
	scanf("%d",&i);
	//3.输出
	printf("ch:%c\n",ch);
	printf("ch2:%c\n",ch2);
	printf("i:%d\n",i);
	return 0;	
}