#include <iostream>
using namespace std;
//CC++中的函数必须返回值，如果该函数没有返回任何数值，声明的时候返回值使用 void
void fa() {
    cout << "fa()" << endl;
}
//重载
/**** 函数重载 （方法重载）
 方法名相同 参数列表不同(类型不同 或者 参数个数不同) 就构成 重载的关系 ******/
//增长经验  直接加
int addExp(int heroExp, int addExp){
    return heroExp + addExp;
}
//增长经验  按百分比 加
int addExp(int heroExp, double addExpPer) {
    return heroExp * (1 + addExpPer);
}
//增长经验  先增加经验值 按百分比 加
int addExp(int heroExp, int addExp, double addExpPer) {
    return (heroExp + addExp) * (1 + addExpPer);
}

int main () {
    fa();
    
    cout << addExp(100, 30) << endl;
    cout << addExp(100, 0.5) << endl;
    cout << addExp(100, 20, 0.5) << endl;
    
    return 0;
}

