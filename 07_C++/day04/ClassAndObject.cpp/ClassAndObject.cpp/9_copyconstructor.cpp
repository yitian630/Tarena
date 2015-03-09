#include <iostream>
using namespace std;

class Date{
    int year;
    int month;
    int day;
public:
    //构造函数  (对象创建时，自动调用)
    Date(int y = 1970, int m = 1, int d = 1) : year(y), month(m), day(d) {
        cout << "Date()" << endl;
    }
    
    //拷贝构造
    Date(const Date& d) {
        this->year = d.year;
        this->month = d.month;
        this->day = d.day;
        cout << "Date(const Date& d)" << endl;
    }
    
    //析构函数  (对象销毁时，自动调用)
    ~Date() {
        cout << "~Date()" << endl;
    }
    
    void show() {
        cout << year << ' ' << month << ' ' << day << endl;
    }
    
    int getYear() {
        return year;
    }
    
    int getMonth() {
        return month;
    }
    
    int getDay() {
        return day;
    }
};

//值 传递
void fa(Date d) {}
//引用 传递
void fb(Date &r) {}
//地址 传递
void fc(Date *p) {}

Date fd(Date &r) {
    return r;
}

Date& fe(Date &r) {
    return r;
}



int main () {
    Date *d = new Date();
    //不会调用拷贝构造 这步没有 创建对象
    Date *d1 = d; //赋值操作
    //会调用拷贝构造 因为new Date(*d) 时会创建新的对象， 并且用 *d 对象中的变量给新对象中的变量 初始化
    Date *d2 = new Date(*d);
    
    Date d3;
    cout << "1 . ==============" << endl;
    fa(d3);
    cout << "2 . ==============" << endl;
    fb(d3);
    cout << "3 . ==============" << endl;
    fc(&d3);
    cout << "4 . ==============" << endl;
    Date d4 = fd(d3);
    cout << "5 . ==============" << endl;
    //会打印 拷贝构造， 因为通过 fe函数的返回值，创建新的对象
    Date d5 = fe(d3);
    cout << "6 . ==============" << endl;
    Date &d6 = fe(d3);
    cout << "6 . ==============" << endl;
}


