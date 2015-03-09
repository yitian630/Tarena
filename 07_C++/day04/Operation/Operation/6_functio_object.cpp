#include <iostream>
using namespace std;


void add(int &r) { r += 10;}
void add1(int &r) { r += 5;}
void print(int &r) {cout << r << ' ';};

void foreach(int *a, int n, void (*f)(int&)) {
    for (int i = 0; i < n; i++) {
        f(a[i]);
    }
}

//函数对象
class Add {
    int x;
public:
    Add(int x = 0) : x(x) {
        
    }
    void operator()(int &r) const{
        r += x;
    }
};

void for_each1(int *a, int n, const Add &f) {
    for (int i = 0; i < n; i++) {
        f(a[i]); //函数对象
//        f.operator()(a[i]);
    }
}


int main () {
    int a[5] = {1, 2, 3, 4, 5};
    foreach(a, 5, add);
    foreach(a, 5, print);
    
    int a1[5] = {1, 2, 3, 4, 5};
    for_each1(a1, 5, Add(11));
    foreach(a1, 5, print);
    return 0;
}


