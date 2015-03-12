#include <iostream>
#include "_2_list.h"
using namespace std;


template <typename T, int n = 10> class Stack : private List<T>{
    int size; //处了记录大小  还可以记录栈顶位置
public:
    Stack():size(){}
    
    void push(const T& d) {
        this->push_front(d);
    }
    
    void pop() {
        this->pop_front();
    }
    
    T top() {
       return this->front();
    }
    
    bool empty() {
        return List<T>::getSize() == 0;
    }
    
    int getSize() {
        return List<T>::getSize();
    }
};

//组合
template <typename T, int n = 10> class Stack2{
    List<T> list;
    int size; //处了记录大小  还可以记录栈顶位置
public:
    Stack2():size(){}
    
    void push(const T& d) {
        list.push_front(d);
    }
    
    void pop() {
        list.pop_front();
    }
    
    T top() {
        return list.front();
    }
    
    bool empty() {
        return list.getSize() == 0;
    }
    
    int getSize() {
        return list.getSize();
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





