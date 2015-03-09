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

void mySwap(int &x, int &y){
//    x = x + y;  //x = 5
//    y = x - y;  //y = 5 - 2 = 3
//    x = x - y;  //x = 5 - 3 = 2
    
    //x = 2, y = 3
    x = x ^ y;
    /*
     x = 0010
     y = 0011
     ----------
     x = 0001
     */
    y = x ^ y;
    /*
     x = 0001
     y = 0011
     ----------
     y = 0010   = 2
     */
    x = x ^ y;
    /*
     x = 0001
     y = 0010
     ----------
     x = 0011   = 3
     */
    cout << x << ' ' << y << endl;

}

void mySwap(int *x, int *y){

    *x = *x + *y;  //x = 5
    *y = *x - *y;  //y = 5 - 2 = 3
    *x = *x - *y;  //x = 5 - 3 = 2

    cout << x << ' ' << y << endl;
}

//（脑筋急转弯方式想一个 解决方案）
//4个数 打印顺序从大到小，不能使用循环，不能使用使用数组， 不能用递归



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
    
    int m = 2;
    int n = 3;
    mySwap(m, n);
    cout << "m = " << m << "  n = " << n << endl;
    
    cout << "===============" << endl;
    mySwap(&m, &n);
    cout << "m = " << m << "  n = " << n << endl;

    
    return 0;
}

