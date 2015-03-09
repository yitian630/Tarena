#include <iostream>
using namespace std;

class F {
    int n; //分子
    int d; //分母
public:
    F(int n = 0, int d = 1) : n(n) , d(d) {}
    //重载 ()类型转换运算符，不需要返回值
    operator double() {
        return n * 1.0 / d;
    }
    
    operator string() {
        char buf[10] = {};
        sprintf(buf, "%d/%d", n, d);
        return buf;
    }
    
};

int main() {
    F f(4, 5);
    double d = (double)f;
    cout << d << endl;
    //f.operator double();
    float _f = (float)f;
    cout << _f << endl;
    int i = (int)f;
    cout << i << endl;
    cout << (string)f << endl;
    //f.operator float();
}
