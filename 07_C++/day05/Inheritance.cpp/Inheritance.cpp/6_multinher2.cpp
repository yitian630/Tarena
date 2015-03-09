#include <iostream>
using namespace std;

class Enemy {
    int hp;
public:
    Enemy(int hp) : hp(hp) {
        cout << "敌人类 构造方法被调用" << endl;
    }
    int  getHp () {
        return hp;
    }
};

//乌鸦  (虚继承)
class Crow : virtual public Enemy{
public:
    Crow(int hp) : Enemy(hp) {
        cout << "乌鸦的构造方法被调用" << endl;
    }
    void fly() {
        cout << "飞行" << endl;
    }
};

//野猪
class Boar : virtual public Enemy {
public:
    Boar(int hp) : Enemy(hp) {
        cout << "野猪的构造方法被调用" << endl;
    }
    void defense() {
        cout << "防御" << endl;
    }
};

//猴子
class Monkey : virtual public Enemy{
public:
    Monkey(int hp) : Enemy(hp) {
        cout << "猴子的构造方法被调用" << endl;
    }
    void AI() {
        cout << "人工只能" << endl;
    }
};

class Boss : public Crow, public Monkey, public Boar{
public:
    Boss() : Crow(100), Boar(200), Monkey(150), Enemy(1000){
        cout << "Boss()" << endl;
    };

};


int main() {
    Boss boss;
    cout << boss.getHp() << endl;
    
    return 0;
}



