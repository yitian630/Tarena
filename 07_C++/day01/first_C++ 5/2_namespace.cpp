#include <iostream>
//使用指令
using namespace std;


namespace hero {
    const char *name = "英雄";
    void show(){
        cout << "英雄出现" << endl;
    }
}

namespace enemy {
    const char *name = "敌人";
    int x = 100;
    void show(){
       cout << "敌人出现" << endl;
    }
}

namespace enemy {
    void setX(int _x) {
        x = _x;
        cout << x << endl;
    }
}
//全局变量
const char *name = "系统NPC";

int main() {
    //使用声明
//    using std::cout;
//    using std::endl;
    
//    //使用指令
//    using namespace std;
    
    using namespace hero;
    using namespace enemy;
    cout << hero::name << endl;
    hero::show();
    enemy::setX(30);
    cout << enemy::name << endl;
    enemy::show();
    //默认所有的东西都在命名空间下，如果没有写命名空间，会默认在一个空命名空间下
    cout << ::name << endl;
    return 0;
}