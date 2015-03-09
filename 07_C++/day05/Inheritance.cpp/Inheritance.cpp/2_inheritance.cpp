#include <iostream>
using namespace std;

class Enemy {
    string name;
public:
//    Enemy() {
//        cout << "Enemy()" << endl;
//    }
    Enemy(string name) : name(name) {
        cout << "Enemy()" << endl;
    }
    
    Enemy(const Enemy &em) {
        name = em.name;
        cout << "Enemy(const Enemy &em)" << endl;
    }
    
    ~Enemy () {
        cout << "~Enemy()" << endl;
    }
    
    void attack() {
        cout << "攻击" << endl;
    }
    void idle() {
        cout << "待机" << endl;
    }
    
    string getName() {
        return name;
    }
};
//恶魔弓箭手
class DemonArrow : public Enemy {
public:
    DemonArrow(string name) : Enemy(name){
        cout << "DemonArrow()" << endl;
    }
    
    DemonArrow(const DemonArrow &dem) : Enemy(dem){
        cout << "DemonArrow(DemonArrow &dem)" << endl;
    }
    
    ~DemonArrow() {
        cout << "~DemonArrow" << endl;
    }
};

int main() {
    DemonArrow arr("人妖弓箭手");
    arr.attack();
    arr.idle();
    cout << arr.getName() << endl;
    
    DemonArrow arr2 = arr;
    cout << arr2.getName() << endl;
    return 0;
}








