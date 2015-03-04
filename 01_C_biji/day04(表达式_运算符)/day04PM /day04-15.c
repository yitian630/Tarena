/*++ --问题*/
#include <stdio.h>
int main(){
	int i = 5;
	int j = 0;
	
	//j = i++; //先运算 后自增
	//j = ++i;//先自增 后运算 
	//XXX运5 i6   运6 i7  
	//j = (i++) + (i++);
	//  运5 i6   运7 i7
	//j = (i++) + (++i);
	//XXX运6 i6 i7运7 运7 i8
	j = (++i) + (++i) + (i++);
	printf("i:%d j:%d\n",i,j);
	
	
	return 0;
}