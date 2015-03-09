#include <iostream>  //引入是 C++标准库的头文件，不加.h
//#include "myC++.h" //引入是 我们自己实现头文件
#include <cstdio> //引入C的头文件时，C++建议 在前面 c 把后面的 .h 去掉


int main () {
    //cout是一个负责输出对象， <<是输出运算符函数
    //std是命名空间  ::域运算符
    std::cout << "First C++" << ' ' << 1234 << ' ' << 'a' << std::endl;
    
    //>>输入运算符函数
    int x;
    std::cin >> x;
    std::cout << x << std::endl;
    
    
    return 0;
}