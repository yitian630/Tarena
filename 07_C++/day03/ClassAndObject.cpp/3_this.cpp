#include <iostream>
using namespace std;

class Date {
public:
    int y, m, d;
public:
    Date(int y = 0, int m = 0, int d = 0) : y(y), m(m), d(d) {
        cout << "Date(int y = 0, int m = 0, int d = 0)" << endl;
    }
    
    void show() {
        printf("%04d-%02d-%02d\n", y, m, d);
    }
    
    void set(int y, int m, int d) {
        
        Date date(2000, 3, 3);
        int x = 200;
        Date date1(2000, 3, 3);
        
        
        //局部变量优先原则
        this->y = y;
        this->m = m;
        this->d = d;
    }
    
    Date& addDay() {
        d++;
        return *this;
    }
};

int main () {
    Date d(2014, 6, 3);
    d.show(); //d.show(&d)
    d.addDay().addDay().addDay();
    d.show();
    cout << sizeof(d) << endl;
    
    
    return 0;
}






