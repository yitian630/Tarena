//
//  MyArray.h
//  Operation
//
//  Created by tarena on 14-6-4.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#ifndef __Operation__MyArray__
#define __Operation__MyArray__

#include <iostream>
using namespace std;
typedef int T;
class MyArray {
    T *m_data;
    //数组存放容量最大值
    int m_capacity;
    //数组中实际存放的元素个数
    int m_size;
    //扩容 只有在本类检测容量不够时，调用
    void expand();
public:
    //explicit 限制该构造函数不能隐试创建对象
    explicit MyArray(int n = 10);
    ~MyArray();
    //拷贝构造
    MyArray(const MyArray& arr);
    //重载 输出运算符函数
    friend ostream& operator<<(ostream& o, MyArray arr);
    //重载 复制运算符函数
    MyArray& operator=(const MyArray &arr);
    //重载下标 运算符
    inline T& operator[](int pos) {
        return m_data[pos];
    }
    //重载下标 运算符
    inline T& operator[](double pos) {
        return m_data[(int)(pos + 0.5)];
    }
    //重载下标 运算符
    inline T& operator[](char pos) {
        return m_data[pos - 'a'];
    }
    
    //从尾部插入元素
    void push_back(const T &d);
    //从指定位置插入
    bool insert(int pos, const T& d);
    //删除指定位置元素
    bool erase(int pos);
    //删除指定元素
    bool remove(const T& d);
    //删除所有元素
    void removeAll();
    //修改指定位置元素
    bool set(int pos, const T& d);
    //查找指定元素的位置
    int find(const T& d);
};

#endif /* defined(__Operation__MyArray__) */


