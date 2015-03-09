#include <iostream>
using namespace std;

class Parent {
private:
    int i0 = 100;
protected:
    int i1 = 200;
public:
    int i2 = 300;
    void show1() {
        
    }
    void show3() {
        
    }
};

class Child1 : public Parent {
public:
    void show() {
//        i0++;
        i1++;
        i2++;
    }
};

class Child2 : protected Parent {
public:
    void show() {
        //        i0++;
        i1++;
        i2++;
    }
};

//
class Child3 : private Parent {
public:
    void show() {
        //        i0++;
        i1++;   //private
        i2++;   //private
    }
    
    void show2(){
        show1();
    }
};


class Child4 : public Child1 {
public:
    void show() {
        i1++;
        i2++;
    }
};

class Child5 : public Child2 {
public:
    void show() {
        i1++;
        i2++;
    }
};

class Child6 : public Child3 {
public:
    void show() {
//        i1++;
//        i2++;
    }
};



int main() {
    Child1 c1;
    c1.show1();
    c1.i2;
    Child2 c2;
//    c2.i2;
    Child3 c3;
    c3.show2();
//    c3.i2;
//    c3.show1();
    return 0;
}







