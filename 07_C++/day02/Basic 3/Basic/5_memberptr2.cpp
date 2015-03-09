#include <iostream>
using namespace std;

struct Date {
    int year;
    int month;
    int day;
    void set(int y, int m, int d) {
        year = y;
        month = m;
        day = d;
    }
    
    void show() {
        cout << year << '-' << month <<'-' << day << endl;
    }
    
    void add() {
        year++;
        month++;
        day++;
        cout << "add" << endl;
    }
};

void test(int x) {
    cout << "test" << x << endl;
}

//给成员函数类型起个别名 FUN
typedef void (Date::*FUN)();
#define selector_function(SET) (FUN)(&SET)

void touch(Date target, FUN f){
    (target.*f)();
}

int main () {
    //函数指针
    void (*f)(int);
    f = test;
    f(200);
    
    //成员函数指针
    void (Date::*mf)();
    mf = &Date::show;
    Date d = {2014, 5, 30};
    (d.*mf)();
    
    void (Date::*mf1)(int,int,int);
    mf1 = &Date::set;
    (d.*mf1)(2015, 5, 30);
    (d.*mf)();
    
    touch(d, selector_function(Date::set));
    
    return 0;
}


