#include <iostream>
using namespace std;

class CGPoint {
    float x;
    float y;
public:
    CGPoint(float x = 0, float y = 0) : x(x), y(y) {
        cout << "CGPoint(int x = 0, int y = 0)" << endl;
    }
    ~CGPoint() {
         cout << "~CGPoint" << x << "," << y << endl;
    }
    void show() {
        cout << "point (" << x << "," << y << ")" << endl;
    }
};

void fa() {
    cout << "fa start " << endl;
    CGPoint p (100, 100);
    p.show();
    cout << "fa end " << endl;
}


void fb() {
    cout << "fb start " << endl;
    CGPoint *p = new CGPoint(100, 100);
    p->show();
    delete p;
    cout << "fb end " << endl;
}

int main () {
    cout << "1========== " << endl;
    fa();
    cout << "2========== " << endl;
    fb();
    cout << "3========== " << endl;
    for (int i = 0; i < 10; i++) {
        CGPoint p(i, i + 1);
        p.show();
    }
    cout << "4========== " << endl;
    {
        CGPoint p1(1, 1);
        CGPoint p2(2, 2);
        CGPoint p3(3, 3);
        CGPoint p4(4, 4);
    }
    cout << "5========== " << endl;
    CGPoint *ps = new CGPoint[3];
    delete[] ps;
    cout << "6========== " << endl;
    CGPoint po[3] = {(4, 4), (4, 4), (4, 4)};
    cout << "7========== " << endl;
    return 0;
}










