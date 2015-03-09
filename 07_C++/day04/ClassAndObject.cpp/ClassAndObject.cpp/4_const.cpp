#include <iostream>
using namespace std;

class Employee {
    string name;
    int age;
    //被 mutable 修饰的变量，可以在 const函数中进行修改
    mutable double salary;
public:
    Employee(string name, int age, double salary) : name(name), age(age), salary(salary) {
        cout << "Employee(string name, int age, dou salary)" << endl;
    }
    
    //在方法名称后加 const
    void show() const{
        //被 mutable 修饰的变量，可以在 const函数中进行修改
        salary = 50000;
        
        cout << name << ' ' << age << ' ' << salary << endl;
        cout << "show() const" << endl;

    }
    
    void show() {
        cout << "show()" << endl;
    }
    
};

int main () {
    
    Employee employee("ZX", 34, 50000);
    //非const修饰对象 如果有非const修饰的函数就调用非const函数，如果没有非const修饰的函数就调用const修饰函数
    employee.show();
    
    const Employee e("PKL", 20, 20000);
    //const对象 不能调用普通的成员函数，只能调用const修饰的函数
    e.show();
    
    
    return 0;
}

