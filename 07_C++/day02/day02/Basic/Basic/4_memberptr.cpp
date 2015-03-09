#include <iostream>
using namespace std;
//成员变量地址 是 相对地址
struct Date {
    int year; //0x0
    int month;//0x4
    int day;//0x8
};

void print(Date *ds, int n, int Date::*p) {
    for (int i = 0; i < n; i++) {
        cout << ds[i].*p << ' ';
    }
    cout << endl;
}


int main () {
    //创建一个成员变量指针 去接收 year的地址
    int Date::* y = &Date::year;
    cout << y << endl;
    int Date::*m = &Date::month;
    cout << m << endl;
    int Date::*d = &Date::day;
    cout << d << endl;
    
    printf("year = %p \n", y);
    printf("month = %p \n", m);
    printf("day = %p \n", d);
    
    
    Date date = {2014, 5, 30};
    cout << date.year << ' ' << date.*y << endl;
    cout << date.month << ' ' << date.*m << endl;
    cout << date.day << ' ' << date.*d << endl;
    
    Date *date1 = new Date;
    date1->year = 2014;
    cout << date1->year << ' ' << date1->*y << endl;
    
    Date ds[] = {{2014,5,30},{2015,6,31},{2016,7,32}};
    print(ds, 3, &Date::day);
    
    
    return 0;
}




