#include <iostream>
using namespace std;

int& fa(int &r) {
    r ++;
    return r;
}

int fb(int &r) {
    r++;
    return r;
}

int& fc() {
    //永远不要返回局部变量的引用
    int x = 200;
    return x;
}

int main () {
    
    int x = 100;
    int &y = fa(x);
    cout << y << endl;
    x ++; //102
    cout << "y = " << y << endl;
    
    int a = 100;
    int b = fb(a);
    cout << b << endl;
    a ++;
    cout << "b = " << b << endl;
    
    int &r = fa(x);
    cout << "x = " << &x << "  r = " << &r << endl;
    int i = fb(x);
    cout << "x = " << &x << "  r = " << &i << endl;
    cout << i << ' ' << x << endl;
    
    int &r5 = fc();
    //值打印200是错的, 是因为内存还没有来得及销毁
    cout << r5 << endl;
    
    
    
    int *c = new int(10);
    delete c;
    //指向垃圾值的指针 是 野指针
    cout << *c << endl;
    c = NULL;
    //再次使用 重新开辟内存空间
    c = new int(100);

    
    return 0;
}

