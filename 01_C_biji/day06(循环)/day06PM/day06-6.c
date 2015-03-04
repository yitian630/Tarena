#include <stdio.h>
int main(){
	/*
    int y,num;
    int j=0;
    scanf("%d",&num);
    y=num;
    while(y!=0){
        y=y/10;
        j++;
       
    }
  */
  int i = 0;//循环变量标识
  int num = 0;//在键盘上输入的数
  printf("请输入一个数:\n");
  scanf("%d",&num);
  
  i = num;
  int length=0;
  /*
  100.123/10
  10.0123/10
  1.00123/10
  0
  */
  
  for(;i!=0;){
  	length++;
  	i= i/10;//表达式3
  }
  printf("num:%d length:%d\n",
  	num,length);
  return 0;
}