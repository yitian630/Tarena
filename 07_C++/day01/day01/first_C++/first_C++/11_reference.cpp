#include <iostream>
using namespace std;


int main () {
    int x = 100;
    int & r = x; //引用 还叫别名, 引用是一辈子
    cout << r << endl;
    r = 200;
    cout << x << endl;
    
    int y = 300;
    r = y; //赋值
    cout << "r = " << r << endl;
    cout << "x = " << x << endl;
    r = 500;
    cout << "x = " << x << endl;
    cout << "y = " << y << endl;
    
    int &r2 = r;
    r2 = 800;
    cout << x << endl;
}