#include <iostream>
using namespace std;

class Date{
    int year;
    int month;
    int day;
public:
    Date() {
        cout << "Date()" << endl;
    }
    
    void show() {
        cout << year << ' ' << month << ' ' << day << endl;
    }
    void setYear(int _year) {
        year = _year;
    }
    void setMonth(int _month) {
        month = _month;
    }
    void setDay(int _day) {
        day = _day;
    }
};


class Time {
    int hour;
    int min;
    int sec;
    Date d;
public:
    //构造方法
    Time(int h = 2014, int m = 5, int s = 30) {
        hour = h;
        min = m;
        sec = s;
        cout << "Time(int h, int m, int s)" << endl;
    }
//    Time() {
//        cout << "Time()" << endl;
//    }
 
//    void init(int h, int m, int s) {
//        hour = h;
//        min = m;
//        sec = s;
//    }
    
    void show() {
        cout << hour << ':' << min << ':' << sec << endl;
    }
    
    void dida() {
        sec++;
        if (sec == 60) {
            sec = 0;
            min++;
        }
        if (min == 60) {
            min = 0;
            hour++;
        }
        if (hour == 24) {
            hour = 0;
        }
    }
    
    void run() {
        while (1) {
            show();
            dida();
            //获取系统时间
            time_t cur = time(0);
            while (cur == time(0));
        }
    }
};

int main() {
    Date d;
    d.setYear(2014);
    d.setMonth(5);
    d.setDay(30);
    d.show();
    
    Time *t = new Time(2014, 5, 30);
    t->show();
//    t->run();
    
    Time *t1 = new Time();
    t1->show();
 
    
    return 0;
}





