#include <iostream>
using namespace std;

class F {
    int n; //分子
    int d; //分母
public:
    F(int n = 0, int d = 1) : n(n) , d(d) {}
    //友元函数可以访问类中的私有变量
    friend ostream& operator<<(ostream &o, F &f);
    //友元函数  及时定义部分写在类中，该函数还是全局函数
    friend istream& operator>>(istream &i, F &f) {
        char ch;
        i >> f.n >> ch >> f.d;
        return i;
    }
    
    //成员函数方式 重载 +运算符函数
    F operator+(const F &f) {
        return F(this->n * f.d +  f.n * this->d, this->d * f.d);
    }
    
    //友元函数重载 -运算符函数  (全局函数)
    friend F operator-(const F& f1, const F& f2) {
        return F (f1.n * f2.d -  f2.n * f1.d, f1.d * f2.d);
    }
   
};

//class myOstream {
//public:
//    myOstream& operator<<(int i) {
//        return *this;
//    }
//    myOstream& operator<<(char * ch) {
//        return *this;
//    }
//    myOstream& operator<<(F f1) {
//        return *this;
//    }
//};


ostream& operator<<(ostream &o, F &f) {
    o << f.n << '/' <<  f.d;
    return o;
}



int main () {
    F f1(4, 5);
    cout << f1 << endl;
    /*cout << f1;
        1.会找 cout.operator<<(f) 如果没有找到往下走
        2.会找 operator<<(cout, f) 如果找到调用
      cout << f1   =  operator<<(cout, f1)
     */
    

    cout << "=========" << endl;
//    cin >> f1;
    /*cin >> f1;  // istream
     1.会找 cin.operator>>(f1) 如果没有找到往下走
     2.会找 operator>>(cin, f) 如果找到调用
     */
//    cout << f1 << endl;
    
    cout << "=============" << endl;
    
    
    //双目运算重载使用 友元函数会更好， 成员函数方式重载运算符函数 和 友元函数方式重组赛运算符函数 都可以， 但是你要确保只能有一个
    F f2(2, 3);
    F f3(3, 4);
    F f4 = f2 + f3;
    F f6 = f2 + 50; //f2.operator+(50)
//    F f7 = 50 + f2;
    //50.operator+(f2)
    cout << f4 << endl;
    /*f2 + f3;
     1.会找 f2.operator+(f3) 如果没有找到往下走 (成员函数)
     2.会找 operator+(f2, f3) 如果找到调用 (友元函数)
     */
//    f3(3, 4)
//    f4(17, 12)
    F f5 = f3 - f4; // operator-(f3, f4);
    F f8 = 50 - f3; // operator-(50, f3);
    cout << f5 << endl;
    cout << f8 << endl;
    return 0;
}





