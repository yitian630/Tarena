#include <iostream>
using namespace std;
class UIButton;

//OC 中只有继承了 NSObject 的类才能使用 OC中的引用计数器内存管理
class NSObject {
    
};

typedef void (NSObject::*CALLBACK)(UIButton *sender);
#define selector(SET) (CALLBACK)(&SET)

class UIButton : public NSObject{
    int tag;
    NSObject *target;
    CALLBACK function;
public:
    /*
     +(UIButton*) buttonWithTarget:(NSObject*)target selector:(CALLBACK)selector;
     */
    static UIButton* createButton(NSObject* target, CALLBACK selector) {
        UIButton *button = new UIButton;
        if (!button->init(target, selector)) {
            delete button;
            button = NULL;
        }
        return button;
    }
    
    bool init(NSObject* _target, CALLBACK _selector) {
        target = _target;
        if (!target) return false;
        function = _selector;
        if (!function) return false;
        return true;
    }
    
    void touchBeginner() {
        (target->*function)(this);
    }
    
    void setTag(int tag) {
        this->tag = tag;
    }
    
    int getTag() {
        return tag;
    }
};

class Hero : public NSObject {
public:
    void Move(UIButton *sender){
        cout << "英雄移动" << endl;
    }
};

class Game : public NSObject{
public:
    void callBack(UIButton *sender) {
        switch (sender->getTag()) {
            case 100:
                cout << "开始游戏" << endl;
                break;
            case 101:
                cout << "开始设置" << endl;
                break;
            case 102:
                cout << "开始帮助" << endl;
                break;
        }
    }
};

class Enemy : public NSObject {
public:
    void Stop(UIButton *sender){
        cout << "敌人停止" << endl;
    }
};

class MyClass : NSObject {
public:
    void init() {
        UIButton *button = UIButton::createButton(this, selector(MyClass::show));
        button->touchBeginner();
    }
    
    void show() {
        cout << "show()" << endl;
    }
};


int main () {
    Hero *hero = new Hero;
  
    
    UIButton *button = UIButton::createButton(hero, selector(Hero::Move));
    button->touchBeginner();
    
    Enemy *enemy = new Enemy;
    UIButton *button1 = UIButton::createButton(enemy, selector(Enemy::Stop));
    button1->touchBeginner();
    
    Game *game = new Game;
    UIButton *button2 = UIButton::createButton(game, selector(Game::callBack));
    button2->setTag(102);
    button2->touchBeginner();
    
    
    MyClass *myClass = new MyClass;
    myClass->init();
    
    return 0;
}






