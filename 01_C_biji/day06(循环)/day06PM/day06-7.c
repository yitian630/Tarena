/*
2.输出100以内的偶数(a.if b.修改表达式3)
3.输出100以内的奇数
*/
#include <stdio.h>
int main(){
	//2*i+1 奇
	
	int i;
	/* 求偶数
	第二种 方法 改表达式3
	for(i=0;i<100;i=i+2){
		printf("%d\n",i);
		 第一种方法
		if(i%2==0){//偶数
			printf("%d\n",i);	
		}
	}
	*/
	// 求奇数
	/*
	for(i=0;i<100;i++){
		if(i%2!=0){
			printf("%d\n",i);	
		}	
	}*/
	for(i=1;i<100;i+=2){//i=i+2
		printf("%d\n",i);
	}
	return 0;
}