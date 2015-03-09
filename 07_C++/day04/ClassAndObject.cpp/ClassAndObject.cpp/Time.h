//
//  Time.h
//  ClassAndObject.cpp
//
//  Created by tarena on 14-6-3.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#ifndef __ClassAndObject_cpp__Time__
#define __ClassAndObject_cpp__Time__

#include <iostream>
using namespace std;

class Time{
    int hour;
    int min;
    int sec;
public:
    /*注意：在 h 文件中声明的方法， 在 cpp 文件中必须实现 */
    //参数默认值 写在 h文件中， 初始化列表写在 cpp文件中
    Time(int h = 0, int m = 0, int s = 0);
    void dida();
    void show();
    void run();
    
    //h文件中如果写了方法的定义部分，即使不加 inline，编译器在编译的时候也会自动加上
    void test() {
        //代码量少， 逻辑简单的情况，编译器才会 按 内联函数处理
        cout << "Test" << endl;
    }
};


#endif /* defined(__ClassAndObject_cpp__Time__) */




