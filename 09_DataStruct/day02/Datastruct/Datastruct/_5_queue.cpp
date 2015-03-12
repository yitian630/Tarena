#include <iostream>
#include "_2_list.h"
using namespace std;

template <typename T>
class Queue {
    List<T>  list;
public:
    void push(const T & d) {
        list.push_back(d);
    }
    void pop() {
        list.pop_front();
    }
    T front() {
       return list.front();
    }
    T back() {
        return list.back();
    }
    bool empty() {
        return list.getSize() == 0;
    }
    int size() {
        return list.getSize();
    }
};

//循环队列
template <typename T>
class Queue2 {
    T data[8];
    int beg; //开始位置
    int size; //结束位置
public:
    Queue2() : beg(), size() {}
    void push(const T & d) {
        if (size == 8) throw "full";
        data[(beg + size) % 8] = d;
        size++;
    }
    void pop() {
        if (size == 0) throw "empty";
        beg++;
        size--;
    }
    T front() {
        return data[beg%8];
    }
    T back() {
        return data[(beg+size-1) %8];
    }
    bool empty() {
        return size == 0;
    }
    int getSize() {
        return size;
    }
};


int main() {
    //链表实现的 队列
    Queue<int> q;
    q.push(100);
    q.push(200);
    q.push(300);
    
    while (!q.empty()) {
        cout << q.front() << ' ';
        q.pop();
    }
    cout << endl;
    
    
    Queue2<int>  q2;
    for (int i = 0; i < 8; i++) {
        q2.push(i);
    }
    q2.pop();
    q2.push(300);
    q2.pop();
    q2.pop();
    q2.push(200);
    while (!q2.empty()) {
        cout << q2.front() << ' ';
        q2.pop();
    }
     cout << endl;
    
    return 0;
}



