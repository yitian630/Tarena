#include <iostream>
using namespace std;

template <typename T>
void print(T *a, int n) {
    for (int i = 0; i < n; i ++) {
        cout << a[i] << ' ';
    }
    cout << endl;
}

//冒泡
template <typename T>
void bubble(T* a, int n) {
    for (int i = 0; i < n - 1; i++) {
        bool flag = true;
        for (int j = 0; j < n -  i - 1; j++) {
            if (a[j] > a[j + 1]) {
                swap(a[j], a[j + 1]);
                flag = false;
            }
        }
        if (flag) break;
    }
}


//选择排序   找到最小那个元素的下标  与左边（下标）的元素交换
template <typename T>
void select(T *a, int n) {
    for (int i = 0; i < n - 1; i++) {
        int k = i; //这里认为k就是最小
        for (int j = i + 1; j < n; j++) {
            if (a[j] < a[k]) {
                k = j;
            }
        }
        if (k != i) {
            swap(a[k], a[i]);
        }
    }
}

//插入排序
template <typename T>
void insert(T *a, int n) {
    for (int i = 1; i < n; i++) {
        //把选择的元素放在临时变量中
         T t = a[i];
        int j = 0;
        for (j = i; j > 0 && a[j - 1] > t; j--) {
            a[j] = a[j - 1];
        }
        a[j] = t;
    }
}


//快速排序
template <typename T>
void qsort(T *a, int n) {
    if(n <= 1) return;
    int L = 0;
    int R = n - 1;
    while (L < R) {
        //一次分组
        while (L < R && a[L] <= a[R]) R--;
        swap(a[L], a[R]);
        while (L < R && a[L] <= a[R]) L++;
        swap(a[L], a[R]);
    }
    //继续左边分组
    qsort(a, L);
    //继续右边分组
    qsort(a + L + 1, n - L - 1);
}

//快速排序
template <typename T>
void qsort2(T *a, int n) {
    if(n <= 1) return;
    int L = 0;
    int R = n - 1;
    int mid = a[L];
    while (L < R) {
        //一次分组
        while (L < R && mid <= a[R]) R--;
        a[L] = a[R];
        while (L < R && a[L] <= mid) L++;
        a[R] = a[L];
    }
    a[L] = mid;
    //继续左边分组
    qsort2(a, L);
    //继续右边分组
    qsort2(a + L + 1, n - L - 1);
}

#define CNT 10000
int main() {
    int a[10] = {3, 2, 4, 5, 7, 8, 9, 1, 6, 0};
//    bubble(a, 10);
//    print(a, 10);
    
//    select(a, 10);
//    print(a, 10);
 
//    insert(a, 10);
//    print(a, 10);
    
//    qsort2(a, 10);
//    print(a, 10);
    
    
    srand((unsigned int)time(0));
    int i_a[CNT];
    for (int i = 0; i < CNT; i++) {
        i_a[i] = rand()%CNT;
    }
    print(i_a, 10);
    
    clock_t start = clock();
//    bubble(i_a, CNT); //0.349
//    select(i_a, CNT); //0.138
//    insert(i_a, CNT); //0.088
//    qsort2(i_a, CNT); //0.001
    clock_t end = clock();
    print(i_a, 10);
    
    cout << "该排序所消耗时间" << (end - start) * 1.0 / CLOCKS_PER_SEC << "秒" << endl;
    
    return 0;
}





