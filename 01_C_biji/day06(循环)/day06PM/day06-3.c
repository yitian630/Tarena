/*1.求1到100数值之和。累加+=
*/
#include <stdio.h>
int main(){
	//声明
	int i;
	int sum=0;
	//使用
	for(i = 0;i < 100;i++){
		//printf("i:%d\n",i+1);	
		sum+=(i+1);//sum = sum + i;
	}
	
	//输出
	printf("sum:%d\n",sum);
	
	return 0;
}