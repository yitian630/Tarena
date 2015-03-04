#include <stdio.h>
int main(){
	int i=0;
	int num;
	printf("请输入一个数字:\n");
	scanf("%d",&num);
	while(i<num){
		num/=10;
		if(num==0){
			printf("这个数字的位数是:%d\n",i+1);
			break;
		}
		i++;
	}
	return 0;
}