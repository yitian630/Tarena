/*双重循环*/
#include <stdio.h>
int main(){
	int i,j;
	//外面的循环执行一次
	//里面的循环执行一遍
	for(i=1;i<9;i++){//双重循环
		for(j=1;j<9;j++){
			printf("%d%d ",i,j);
		}	
		printf("\n");
	}
	return 0;
}