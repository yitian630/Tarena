#include<iostream>
#include "MyArray.h"

void show(MyArray arr) {
    
}

int main() {
    MyArray arr;
    for (int i = 0; i < 100; i++) {
        arr.push_back(i);
    }
    arr.insert(2, 300);
    arr.erase(3);
 

    arr.insert(2, 300);
    arr.insert(2, 300);
    arr.insert(2, 300);
    arr.insert(2, 300);
    cout << arr << endl;
    cout << "======" << endl;
    arr.remove(300);
    arr.set(1, 800);
    cout << arr.find(800) << endl;
    cout << arr << endl;
    arr.removeAll();
    cout << "======" << endl;
    cout << arr << endl;
    
    arr.push_back(1);
    arr.push_back(2);
    arr.push_back(3);
    arr.push_back(4);
    arr.push_back(5);
    cout << arr[1] << endl; //arr.operator[]();
    cout << arr << endl;
    
    cout << arr[3.14] << endl;
    cout << arr['a'] << endl;
    
    //如果你写数组类，不能出现该种语法
//    show(100);
    
    return 0;
}




