#include <iostream>
using namespace std;

class CCLayer {
public:
    virtual bool init() {
        return true;
    }
};


class Animal {
    string name;
public:
    Animal(string name) : name(name) {
        
    }
    
    string getName() {
        return name;
    }

    void eat() {
        cout << "Animal eat" << endl;
    }
    //只有虚函数，才能被重写
    virtual void sleep() {
        cout << "Animal sleep" << endl;
    }
    
    virtual void feed(string food) {
        cout << "Animal eat " << food << endl;
    }

};

class Dog : public Animal {
public:
    Dog() : Animal("狗") {
        
    }
    //名字隐藏
    void eat() {
        cout << "Dog eat" << endl;
    }
    //重写  （覆盖）
    virtual void sleep() {
        cout << "Dog sleep" << endl;
    }
    
    virtual void sleep(int a) {
        cout << "Dog sleep" << endl;
    }
};

class Cat : public Animal {
public:
    Cat() : Animal("猫") {
        
    }
 
    //名字隐藏
    void eat() {
        cout << "Cat eat" << endl;
    }
    //重写  （覆盖）
    virtual void sleep() {
        cout << "Cat sleep" << endl;
    }

};

void feed(Animal *animal, string food) {
    cout << animal->getName() << " eat " << food << endl;
}

int main() {
    Animal *animal = new Dog;
    //静态绑定
    animal->eat();
    //动态绑定  这里调用发现 sleep 是虚函数，
    animal->sleep();
    ((Dog*)animal)->sleep(123);
    
    Dog *g = new Dog();
    g->eat();
    g->Animal::eat();
    g->Animal::sleep();
    
    Animal *animal2 = new Cat();
    animal2->sleep();
    
    Cat *cat = new Cat();
    
    feed(g, "骨头");
    feed(cat, "鱼");
    
    Dog dog;
    Animal &an = dog;
    an.sleep();
    Cat c;
    Animal &an1 = c;
    an1.sleep();
    return 0;
}



