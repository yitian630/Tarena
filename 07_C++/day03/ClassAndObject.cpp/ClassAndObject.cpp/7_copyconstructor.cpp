#include <iostream>
using namespace std;

class CGPoint {
    float x;
    float y;
public:
    CGPoint(float x = 0, float y = 0) : x(x), y(y) {
        cout << "CGPoint(int x = 0, int y = 0)--" << this << endl;
    }
    //拷贝构造函数 (标准：你不写，编译器也会帮你写一个标准的拷贝构造)
    CGPoint(const CGPoint &point) {
        this->x = point.x;
        this->y = point.y;
//        cout << "CGPoint(CGPoint &point)" << this << endl;
    }
    ~CGPoint() {
        cout << "~CGPoint--" << this << "  " << x << "," << y << endl;
    }
    void show() {
        cout << "point (" << x << "," << y << ")" << "  "<< this << endl;
    }
};

int main() {
    CGPoint p1(100, 100);
    //使用同类型对象创建对象时，会调用对象的拷贝构造函数
    CGPoint p2 = p1;
//    CGPoint p2(p1);
    p2 = p1; //赋值运算符函数
    p1.show();
    p2.show();
    
    const CGPoint p3;
    CGPoint p4 = p3;
    
    return 0;
}



