#include <iostream>
using namespace std;

class myNSNumber{
    int x;
public:
    myNSNumber(int x) : x(x) {}
    myNSNumber(const char* c){
        cout << "myNSNumber(const char* c)" << endl;
    }
    friend ostream& operator<<(ostream &o,myNSNumber num) {
        o << num.x;
        return o;
    }
    
    friend const myNSNumber operator+(const myNSNumber &num1, const myNSNumber &num2) {
        return num1.x + num2.x; //隐士的类型转换
    }
    
    friend const myNSNumber operator-(const myNSNumber &num1, const myNSNumber &num2) {
        return num1.x - num2.x;
    }
    
    
    //重载 > 运算符函数
    friend bool operator>(const myNSNumber &num1, const myNSNumber &num2) {
        return num1.x > num2.x;
    }
    
    /*
       * / % > >= < <= == !=
     */
    
    //单目运算符  -  !  ~  前++ 后++
    //用成员方式比较好, 因为成员函数是对象调用调用，属于本类的。 封装更好
    const myNSNumber operator-() const{
        return -x;
    }
 
    bool operator!() const{
        return !x;
    }
    
    const myNSNumber operator~() const{
        return ~x;
    }
    
    //前++
    myNSNumber& operator++(){
        this->x ++;
        return *this;
    }
    //后++   有哑元参数的++运算符函数是 后++运算符函数
    myNSNumber operator++(int){
        myNSNumber old = *this;
        this->x ++;
      return old;
    }
    
};


int main () {
    myNSNumber num(200);
    cout << num << endl;
    myNSNumber num2(300);
    cout << num2 << endl;
    myNSNumber num3 = num + num2;
    cout << num3 << endl;
    //临时值 不能作为 左值出现（只能用于给别的变量赋值）
//    num + num2 = 600;
    myNSNumber num4 = num - num2;
    cout << num4 << endl;

    //num4 > num3 等价于 operator>(num4, num3)
    cout << (num4 > num3) << endl;
    
   
    myNSNumber num5 = myNSNumber(500);
    cout << (-num5) << endl;
    const myNSNumber num6 = -100;//隐士类型转换， 调用对应的构造方法创建了一个对象
//    num6.operator-();
    cout << (-num6) << endl;
    cout << !num6 << endl;
    //num6  ~ +1取反
    cout << ~num6 << endl;
    cout << ++++++num5 << endl;
 
    num5 = 10;
    myNSNumber num7 = ++num5 + num5++ + num5++;
    cout << num7 << endl;
    cout << num5 << endl;
    cout << "=============" << endl;
    myNSNumber num8 = "sdsf";
    
    return 0;
}



