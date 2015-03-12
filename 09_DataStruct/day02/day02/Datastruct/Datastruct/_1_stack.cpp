//
//  main.cpp
//  Datastruct
//
//  Created by tarena on 14-6-26.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#include <iostream>
using namespace std;

template <typename T, int n = 10>
class Stack {
    T data[n];
    int size; //处了记录大小  还可以记录栈顶位置
public:
    Stack():size(){}
    
    void push(const T& d) {
        data[size++] = d;
    }
    
    void pop() {
        size--;
    }
    
    T top() {
        return data[size - 1];
    }
    
    bool empty() {
        return size == 0;
    }
    
    int getSize() {
        return size;
    }
};




int main()
{
    Stack<int, 20> stack;
    stack.push(30);
    stack.push(60);
    stack.push(80);
    
    while (!stack.empty()) {
        cout << stack.top() << endl;
        stack.pop();
    }
    
    
    
     return 0;
}














