#include <iostream>
using namespace std;

class Example {
public:
    int x; //成员变量
    //静态成员变量 是属于类的而不是属于对象
    static int s; //静态成员变量
    
    static void show() {
        cout << "show" << endl;
        //静态方法中，不可以访问成员变量，因为不存在this指针
//        this->x;
        //静态方法中可以访问静态变量
        s = 100;
        //静态方法中，不可以访问普通成员函数
//       this->show1();
    }
    
    void show1 () {
        this->x;
        //普通成员方法中 可以访问 静态变量
        s = 200;
        //普通成员方法中 可以访问 静态的成员方法
        show();
    }
    
};
//在全局区 分配一个 int 型的 Example类下的静态变量 s 的空间
int Example::s;

int main() {
    Example e1;
    Example e2;
    e1.x = 200;
    e2.x = 300;
    //静态变量 建议使用类名调用
    Example::s = 200;
    cout << e1.x << "  " << e2.x << endl;
    cout << "s = " << e1.s << "  " << e2.s << endl;
    
    e1.show();
    
    Example::show();
    
    return 0;
}





