#include <iostream>
using namespace std;

enum {
    UP = 100,
    DOWN,
    LEFT,
    RIGHT
};


struct Button{
    int tag;
    void show() {
        cout << "第" << tag << "个按键被调用" << endl;
    }
};

void touch(Button sender){
    sender.show();
    switch (sender.tag) {
        case UP:
            cout << "向上移动" << endl;
            break;
        case DOWN:
            cout << "向下移动" << endl;
            break;
        case LEFT:
            cout << "向左移动" << endl;
            break;
        case RIGHT:
            cout << "向右移动" << endl;
            break;
    }
}

int main () {
    Button b;
    b.tag = UP;
    
    touch(b); //第100个按键被调用   向上移动
    
    
    return 0;
}




