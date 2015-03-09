#include <iostream>
using namespace std;

struct Date {
    int y, m, d;
    void show() {
        cout << y << '-' << m << '-' << d << endl;
    }
};
int x; //变量在全局区
Date d;//全局区

void fa() {
    int x; //变量在 栈里
    Date d; //在栈里的对象，在出了代码块会自动释放
    
    int *p = new int; //在堆里开辟内存空间
    *p = 100;
    cout << *p << endl;
    delete p;
    
    Date *d1 = new Date;
    d1->y = 2014;
    d1->m = 5;
    d1->d = 29;
    d1->show();
    delete d1;
    
    //在堆中开辟空间，并赋值
    int *pi = new int(10);
    cout << *pi << endl;
    delete pi;
    pi = new int[10];
    for (int i = 0; i < 10; i++) {
        pi[i] = i;
        cout << pi[i] << ' ';
    }
    cout << endl;
    delete[] pi;//释放数组
    
    //定位分配
    char buf[1024] = {};
    int *pi2 = new(buf) int(123);
    cout << *pi2 << endl;
    int *pi3 = new(buf + 50) int(2000);
    cout << *pi2 << endl;
    cout << *pi3 << endl;

}



int main() {
    fa();
    return 0;
}



