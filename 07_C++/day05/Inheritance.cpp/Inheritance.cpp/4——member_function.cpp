#include <iostream>
using namespace std;
//名字隐藏
class Enemy {
public:
    void attack() {
        cout << "敌人攻击" << endl;
    }
    void die() {
        cout << "敌人死亡" << endl;
    }
    
    static void idle() {
        cout << "敌人待机" << endl;
    }
};

class DemonArrow : public Enemy{
public:
    //名字隐藏 要求函数名与父类的函数名相同， 把父类的函数隐藏起来
    void attack() {
        cout << "弓箭手攻击" << endl;
    }
    void attack(int a) {
        cout << "弓箭手攻击" << endl;
    }
    void die() {
        cout << "弓箭手死亡" << endl;
    }
    
    static void idle() {
        cout << "弓箭手待机" << endl;
    }
};

int main() {
    DemonArrow arr;
    arr.attack();
    arr.die();
    //由于子类有与父类方法名相同的方法，那么要调用父类的方法，只能指明调用
    arr.Enemy::attack();
    arr.Enemy::die();
    
    Enemy::idle();
    DemonArrow::idle();
    DemonArrow::Enemy::idle();
    return 0;
}





