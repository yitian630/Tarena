#include <iostream>
using namespace std;

class CGPoint {
    float x, y;
public:
    CGPoint(int x = 0, int y = 0) : x(x), y(y) {
        cout << "CGPoint(int x = 0, int y = 0)" << endl;
    }
    CGPoint(const CGPoint &p) {
        this->x = p.x;
        this->y = p.y;
        cout << "CGPoint(const CGPoint &p)" << endl;
    }
    ~CGPoint() {
        cout << "~CGPoint())" << endl;
    }
    
    CGPoint& operator=(const CGPoint &p) {
        this->x = p.x;
        this->y = p.y;
        
        cout << "CGPoint& operator=(const CGPoint &p)" << endl;
        return *this;
    }
    
    
    int getX() {
        return x;
    }
    
    int getY() {
        return y;
    }
};

int main() {
    CGPoint p(100, 100);
    CGPoint p1 = p;
    CGPoint p2;
    p2 = p1;
//    p2.operator=(p1);
    cout << p2.getY() << endl;
    
    return 0;
}



