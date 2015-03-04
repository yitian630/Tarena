/*
	输入一个分数，0~100之间的整数，
	根据分数得到相应的级别？根据级别得分数?
		a.100~90 A、89~80 B、 
			79~70 C、69~60 D、59~0 E
		b.A  100~90、B  89~80 、
			C 79~70、D 69～60、E 59~0
*/
#include <stdio.h>
int main(){
	int score = 95;
	char level = 'a'
	//使用不够灵活 
	//更直观
	//灵活 if 简单 switch
	switch(level){
		case 'a':	
		case 'A':printf("100~90\n");break;
		case 'b':	
		case 'B':printf("89~80\n");break;
		case 'c':	
		case 'C':printf("79~60\n");break;
	}
	
	
	return 0;	
}