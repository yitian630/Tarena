//
//  MyArray.cpp
//  Operation
//
//  Created by tarena on 14-6-4.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#include "MyArray.h"

MyArray::MyArray(int n) : m_capacity(n), m_size(0) {
    m_data = new T[m_capacity];
}

MyArray::~MyArray() {
    delete[] m_data;
    m_data = NULL;
}
//拷贝构造
MyArray::MyArray(const MyArray& arr) {
    m_capacity = arr.m_capacity;
    m_size = arr.m_size;
    m_data = new T[m_capacity];
//    for (int i = 0; i < arr.m_size; i++) {
//        m_data[i] = arr.m_data[i];
//    }
    //参数： 目标   源  大小
    memcpy(m_data, arr.m_data, m_size * sizeof(T));
}
//重载 输出运算符函数
ostream& operator<<(ostream& o, MyArray arr){
    for (int i = 0; i < arr.m_size; i++) {
        cout << arr.m_data[i] << ' ';
    }
    return o;
}

//重载 复制运算符函数
MyArray& MyArray::operator=(const MyArray &arr){
    if (this == &arr) return *this;
    if (m_data) delete[] m_data;
    m_data = new T[arr.m_capacity];
    memcpy(m_data, arr.m_data, m_size * sizeof(T));
    return *this;
}

//从尾部插入元素
void MyArray::push_back(const T &d) {
//    if (m_size == m_capacity)
//        expand();
//    
//    m_data[m_size] = d;
//    m_size++;
    
    //优化为
    insert(m_size, d);
}


void MyArray::expand() {
    m_capacity *= 2;
    T* temp = new T[m_capacity];
    memcpy(temp, m_data, m_size * sizeof(T));
    delete[] m_data;
    m_data = temp;
}

//从指定位置插入
bool MyArray::insert(int pos, const T& d) {
    if (pos < 0 || pos > m_size) {
        return false;
    }
    if (m_size == m_capacity){
        expand();
    }
        
    for (int i = m_size; i > pos; i--) {
        m_data[i] = m_data[i-1];
    }
    m_data[pos] = d;
    m_size++;
    return true;
}
//删除指定位置元素
bool MyArray::erase(int pos) {
    if (pos < 0 || pos >= m_size) {
        return false;
    }
    for (int i = pos; i < m_size-1; i++) {
        m_data[i] = m_data[i+1];
    }
    m_size--;
    return true;
}

//删除指定元素
bool MyArray::remove(const T& d) {
    bool is = false;
    for (int i = 0; i < m_size; i++) {
        if(m_data[i] == d) {
            erase(i);
            is = true;
            i--;
        }
    }
    return is;
}
//删除所有元素
void MyArray::removeAll() {
    while (erase(0)) ;
}

//修改指定位置元素
bool MyArray::set(int pos, const T& d) {
    if (pos < 0 || pos >= m_size) {
        return false;
    }
    m_data[pos] = d;
    return true;
}
//查找指定元素的位置
int MyArray::find(const T& d) {
    for (int i = 0; i < m_size; i++) {
        if (m_data[i] == d) {
            return i;
        }
    }
    return -1;
}

