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

//乌鸦
class Crow : public Enemy{
//    int hp;
public:
    Crow(int hp) : Enemy(hp) {
        cout << "乌鸦的构造方法被调用" << endl;
    }
    void fly() {
        cout << "飞行" << endl;
    }
//    int getHp() {
//        return hp;
//    }
};

//野猪
class Boar : public Enemy {
//    int hp;
public:
    Boar(int hp) : Enemy(hp) {
        cout << "野猪的构造方法被调用" << endl;
    }
    void defense() {
        cout << "防御" << endl;
    }
//    int getHp() {
//        return hp;
//    }
};

//猴子
class Monkey : public Enemy{
//    int hp;
public:
    Monkey(int hp) : Enemy(hp) {
        cout << "猴子的构造方法被调用" << endl;
    }
    void AI() {
        cout << "人工只能" << endl;
    }
//    int getHp() {
//        return hp;
//    }
};

class Boss : public Crow, public Monkey, public Boar{
public:
    Boss() : Crow(100), Boar(200), Monkey(150){
        cout << "Boss()" << endl;
    };
    //名字隐藏
    int getHp() {
        return Crow::getHp() + Boar::getHp() + Monkey::getHp();
    }
};

int main () {
    Boss boss;
    boss.fly();
    boss.defense();
    boss.AI();
    cout << boss.getHp() << endl;
    
    
    return 0;
}

