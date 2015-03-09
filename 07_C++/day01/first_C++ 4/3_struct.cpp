#include <iostream>
using namespace std;
//C++中的结构体 就是 类
struct Date {
    int year;
    int month;
    int day;
    void show() {
        cout << year << '-' << month << '-' << day <<endl;
    }
};

//结构体 作为参数
void fa(Date d){
    d.year++;
}
void fb(Date *d){
//    (*d).year++;
    d->year ++;
}
Date fc(){
    Date d;
    return d;
};
Date* fd(){return NULL;};




int main() {
    //对象在栈里
    Date d;
    d.year = 2014;
    d.month = 5;
    d.day = 29;
    d.show();
    
    fa(d); // 值传递
    cout << d.year << endl;
    //d.year = 2014  2015
    
    d.year = 2014;
    fb(&d);// 地址传递
    cout << d.year << endl;
    //d.year = 2014  2015
    
    return 0;
}







