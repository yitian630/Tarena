#include <iostream>
using namespace std;

enum HeroState{
    Stand,
    Move,
    Attack,
    Die
};

enum {
    Hero_Stand,
    Hero_Move,
    Hero_Attack,
    Hero_Die
};
//const int Hero_Stand = 0;
//const int Hero_Move = 1;

int main () {
    
    HeroState state;
    state = Move;
    //C++类型检查 非常严格
    state = (HeroState)1;
    
    int x;
    x = Move;
    cout << x << endl; // 1
    return 0;
}