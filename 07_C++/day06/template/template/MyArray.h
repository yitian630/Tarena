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
template<typename T>
class MyArray {
    T *m_data;
    //数组存放容量最大值
    int m_capacity;
    //数组中实际存放的元素个数
    int m_size;
    //扩容 只有在本类检测容量不够时，调用
    void expand() {
        {
            m_capacity *= 2;
            T* temp = new T[m_capacity];
            memcpy(temp, m_data, m_size * sizeof(T));
            delete[] m_data;
            m_data = temp;
        }
    }
public:
    //explicit 限制该构造函数不能隐试创建对象
    explicit MyArray(int n = 10) : m_capacity(n), m_size(0) {
        m_data = new T[m_capacity];
    }

    ~MyArray() {
        delete[] m_data;
        m_data = NULL;
    }

    //拷贝构造
    MyArray(const MyArray& arr){
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
    friend ostream& operator<<(ostream& o, MyArray arr){
        for (int i = 0; i < arr.m_size; i++) {
            cout << arr.m_data[i] << ' ';
        }
        return o;
    }

    //重载 复制运算符函数
    MyArray& operator=(const MyArray &arr){
        if (this == &arr) return *this;
        if (m_data) delete[] m_data;
        m_data = new T[arr.m_capacity];
        memcpy(m_data, arr.m_data, arr.m_size * sizeof(T));
        m_size = arr.m_size;
        return *this;
    }

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
    void push_back(const T &d){
        //    if (m_size == m_capacity)
        //        expand();
        //
        //    m_data[m_size] = d;
        //    m_size++;
        
        //优化为
        insert(m_size, d);
    }

    //从指定位置插入
    bool insert(int pos, const T& d) {
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
    bool erase(int pos){
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
    bool remove(const T& d) {
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
    void removeAll() {
        while (erase(0)) ;
    }
    //修改指定位置元素
    bool set(int pos, const T& d){
        if (pos < 0 || pos >= m_size) {
            return false;
        }
        m_data[pos] = d;
        return true;
    }
    //查找指定元素的位置
    int find(const T& d) {
        for (int i = 0; i < m_size; i++) {
            if (m_data[i] == d) {
                return i;
            }
        }
        return -1;
    }
    
    int getSize(){
        return m_size;
    }

};

#endif /* defined(__Operation__MyArray__) */


