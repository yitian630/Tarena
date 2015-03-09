#include <iostream>
using namespace std;
//遍历数组元素
//void print(int *a, int n) {
//    for (int i = 0; i < n-1; i++) {
//        cout << a[i] << ' ';
//    }
//    cout << a[n-1] << endl;
//}
//void print(int *a, int n, char ch) {
//    for (int i = 0; i < n-1; i++) {
//        cout << a[i] << ch;
//    }
//    cout << a[n-1] << endl;
//}
//参数都默认值 必须 从右往左给
void print(int *a, int n, char ch = ' ', bool flag = true) {
    if (flag) {
        cout << '[';
    }
    for (int i = 0; i < n-1; i++) {
        cout << a[i] << ch;
    }
    cout << a[n-1] << (flag?']':' ') << endl;
}

//内联函数，提升性能
inline void print(int x) {
    cout << "x = " << x << endl;
    print(100);
}


int main() {
    int a[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

    print(a, 10);
    print(a, 10, '%');
    print(a, 10, '%', false);
    
    
    print(100);

    return 0;
}



