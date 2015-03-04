/*
	goto
*/
#include <stdio.h>
int main(){
	int i,j;
	for(i=0;i<3;i++){
		for(j=0;j<2;j++){
			if(i==1){
				goto escape;	
			}
			printf("%d%d ",i,j);
			printf(" 内循环执行结束");
		}	
		printf("外循环执行结束");
		printf("\n");
	}
	escape:
		printf("程序执行此位置.\n");
	printf("程序结尾\n");
	return 0;
}