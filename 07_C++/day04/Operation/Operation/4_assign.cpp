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

class Employee {
    string name;
    //指向 Date 对象的指针
    Date *date;
public:
    Employee(string name, int y, int m, int d) : name(name){
        //在堆里创建对象
        date = new Date(y, m, d);
        
        cout << "Employee(string name, int y, int m, int d)" << endl;
    }
    
    //拷贝构造
    Employee(const Employee &em) {
        this->name = em.name;
        
        //开辟Date类型内存空间， 用em对象中date对象给当前对象赋值。
        this->date = new Date(*em.date);
        cout << "Employee(const Employee &em)" << endl;
    }
    
    void show() const{
        cout << name << " 生日:" << date->getYear() << '-' << date->getMonth() << '-' << date->getDay() << endl;
    }
    
    ~Employee() {
        //如果类中有个变量，是指向其他对象的指针，那么在析构方法中，必须先 delete 指针
        delete date;
        date = NULL;
        cout << "~Employee()" << endl;
    }
    
    
    Employee& operator=(const Employee &em) {
        
//        this->date = em.date;
        /*
            赋值运算符重载的一般过程
         1.判断是否自赋值
         2.释放原有内存资源
         3.申请新的内存空间
         4.复制数据
         5.返回当前对象
         */
        if (this == &em) {
            return *this;
        }
        if (date) {
            delete date;
            date = NULL;
        }
        //开辟Date类型内存空间， 用em对象中date对象给当前对象赋值。
        date = new Date(*em.date);
      
        name = em.name;

        return *this;
    }
    
};

int main () {
    Employee em("ZX", 1979, 10, 27);
    Employee em1 = em;
    Employee em3("ZX", 1979, 10, 27);
    em3 = em1;
    //em3.operator=(em1)
    
    
    return 0;
}



