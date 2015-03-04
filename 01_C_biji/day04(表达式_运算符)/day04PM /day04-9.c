/*
	逻辑表达式的使用
*/
#include <stdio.h>
int main(){
	/*
	if(逻辑或关系表达式){
			//当逻辑表达式为真时 
			//会执行此部分语句
	}
	*/
	//使用键盘输入两门课的成绩 如果都大于90分
	//输出"成绩是优秀" 否则不做任何处理
	
	//声明
	int score1 = 0;
	int score2 = 0;
	//使用
	printf("请输入第一门课的成绩:\n");
	scanf("%d",&score1);
	printf("请输入第二门课的成绩:\n");
	scanf("%d",&score2);
	
	//输出
	if(score1>90&&score2>90){
		printf("成绩是优秀\n");	
	}
	
	//任意一门课的成绩高于95分 就有可能拿到
	//奖学金
	if(score1>95||score2>95){
		printf("就有可能拿到奖学金\n");	
	}
	
	return 0;
}