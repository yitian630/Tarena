#include <iostream>
#include "MyArray.h"
using namespace std;

template<typename T = int, int n = 10>
class Buffer{
    T buf[n];
    int size;
public:
    Buffer(): size(){
    }
    void push(T d) {
        buf[size] = d;
        size ++;
    }
    T get(int position) {
        return buf[position];
    }
};




int main() {
    Buffer<int, 200> fuff;
    
    const int a = 200;
    Buffer<int, a> buff;

    
    
    return 0;
}


