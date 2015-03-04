#include <stdio.h>
int main (){
  
  char n;
  char x;
  int o;
  int q;
  //int a=0;
  //int b=0;
 //a=18; 
 //b=6000; 
  
  printf(" 请输入姓名：\n");
  scanf("%c",&n);
  printf("姓名:%c\n",n);
  
  printf(" 请输入年龄：\n");
  scanf("%d",&o);
  printf("年龄:%d\n",o);
  
  scanf("%*c");
  printf(" 请输入性别：\n");
  scanf("%c",&x);
  printf("性别:%c\n",x);
  
  printf(" 请输入期望年薪：\n");
  scanf("%d",&q);
  printf("期望年薪:%d\n",q);
  
  printf("税薪:%f\n",q*0.13);
 
  return 0;
}