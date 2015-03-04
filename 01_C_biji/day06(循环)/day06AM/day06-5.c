#include <stdio.h>
int main(){
	int i;
	printf("i:%d\n",i);
	for(i=0;i<10;i++){
		if(i==2){
			continue;//终止当次循环
			//break;终止循环	
		}
		printf("HelloWorld!%d\n",i);
	}
	printf("程序末尾\n");
	/*
		表达式1：可以省略，但有可能不执行循环体，
		也可以放在其它位置，但必须是循环执行前。
		表达式2 可以省略，有可能变成死循环，但默
		认值为1 不可以放在其它位置
		表达式3 可以省略，有可能变成死循环，可以
		放在其它位置，但只能放在循环体的后面
	*/
	return 0;
}