#include <iostream>
using namespace std;

void fa(int &r) {
    r++;
    cout << "r = " << &r << endl;
}
//参数为常引用 既可以引用变量 也可以引用常量
void fd(const int &r) {
    //常引用不能修改
//    r++;
}
void fb(int n) {
    n++;
    cout << "n = " << &n << endl;
}
void fc(int *p) {
    (*p)++;
    cout << "p = " << p << endl;
}

int main() {
    int x = 100;
    cout << "fa(x) " << &x << endl;
    fa(x);
    cout << x << endl; //100  101
    
    x = 100;
    cout << "fb(x) " << &x << endl;
    fb(x);
    cout << x << endl; //100
    
    x = 100;
    cout << "fc(x) " << &x << endl;
    fc(&x);
    cout << x << endl;

    //常量 只能用常引用
    const int &r1 = 100;
    fd(100);
    fd(x);
    
    return 0;
}





