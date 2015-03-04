#include <stdio.h>
int main(){
	
int n1;//年龄	
char ch;//性别
int n2;//期望薪资
float f1;//税资
float f2 = 0.0;//税资率


printf("%d %f %f\n",n2,f2,f1);


f2 = 0.13;
printf("输入年龄:");
scanf("%d",&n1);
printf("输入性别：");
scanf("%*c");
scanf("%c",&ch);
printf("输入期望薪资：");
scanf("%d",&n2);
printf("姓名：fyx   年龄：%d\n",n1);
printf("性别：%c     期望薪资：%d\n",ch,n2);

f1 = n2*f2;
printf("税资=%d*%.2f=%.2f\n",n2,f2,f1);
	
	return 0;
}