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
    
    //参数传入指针
    Employee(string name, Date *date) : name(name){
        //是给当前对象的date指针赋值
        this->date = date;
        cout << "Employee(string name, int y, int m, int d)" << endl;
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

    
};




int main() {
    cout << "1==========" << endl;
//    {  //代码块， 复合语句
//    Date d;
//    }
    cout << "2==========" << endl;
    
    Employee e("ZX", 1979, 10, 27);
    e.show();

    
    Employee *e1 = new Employee("ZX", 1979, 10, 27);
    e1->show();
    
    cout << "3==========" << endl;
    Date *date = new Date();
    
    {
    Employee *e2 = new Employee("ZX", date);
    e2->show();
    }
    //这行应该报错， date指向那块内存已经被释放。
//    cout << date->getYear() << endl;
    
    return 0;
}




