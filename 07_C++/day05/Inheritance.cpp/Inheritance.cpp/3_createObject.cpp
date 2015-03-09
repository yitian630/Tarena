#include <iostream>
using namespace std;

/*创建 对象(继承) 过程
 1.申请内存空间
 2.递归的创建父类对象
 3.初始化成员变量， 如果成员变量是一个对象，创建它
 4.调用构造函数
*/
class NSObject{
public:
    NSObject() {
        cout << "NSObject() " << endl;
    }
    ~NSObject() {
        cout << "~NSObject() " << endl;
    }
};

class Parent : public NSObject {
public:
    Parent() {
        cout << "Parent() " << endl;
    }
    ~Parent() {
        cout << "~Parent() " << endl;
    }
};

class Other {
public:
    Other() {
        cout << "Other() " << endl;
    }
    ~Other() {
        cout << "~Other() " << endl;
    }
};

class Child : public Parent {
    Other other;
public:
    Child() {
        cout << "Child() " << endl;
    }
    ~Child() {
        cout << "~Child() " << endl;
    }
};

int main () {
    Child ch;
    
    return 0;
}



