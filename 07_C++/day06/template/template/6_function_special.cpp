#include <iostream>
using namespace std;

template<typename T>
void mySort(T a[], int n) {
    for (int i = 0; i < n - 1; i ++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (a[j] > a[j + 1]) {
                //创建临时变量 保存数组中 j 位置的 元素
                T t = a[j];
                a[j] = a[j + 1];
                a[j + 1] = t;
            }
        }
    }
}

//特化
void mySort(const char* a[], int n) {
    for (int i = 0; i < n - 1; i ++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (strcmp(a[j], a[j+1]) > 0) {
                //创建临时变量 保存数组中 j 位置的 元素
                const char* t = a[j];
                a[j] = a[j + 1];
                a[j + 1] = t;
            }
        }
    }
}


//排序方法  偏特化（偏专门化）
template<typename T>
void mySort(T *a[], int n) {
    for (int i = 0; i < n - 1; i ++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (*a[j] > *a[j + 1]) {
                //创建临时变量 保存数组中 j 位置的 元素
                T *t = a[j];
                a[j] = a[j + 1];
                a[j + 1] = t;
            }
        }
    }
}



template<typename T>
void print(T a[], int n) {
    for (int i = 0;  i < n; i++) {
        cout << a[i] << ' ';
    }
    cout << endl;
}

//偏特化
template<typename T>
void print(T *a[], int n) {
    for (int i = 0;  i < n; i++) {
        cout << *a[i] << ' ';
    }
    cout << endl;
}

int main () {
    int a[] = {3, 5, 7, 9, 1};
    mySort(a, 5);
    print(a, 5);
    
    const char *cs[5] = {"fbc","abc","bbc","dbc","ccc"};
    mySort(cs, 5);
    print(cs, 5);
    
    
    int *is[5] = {new int(123),new int(345),new int(456),new int(678),new int(789)};
    mySort(is, 5);
    print(is, 5);
    
    double *ds[5] = {new double(123.21),new double(345.11),new double(456.33),new double(678.55),new double(789.77)};
    mySort(ds, 5);
    print(ds, 5);
    
    return 0;
}








