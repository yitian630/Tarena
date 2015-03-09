#include <iostream>
using namespace std;

//函数模板
template <typename T>
T Max(T a, T b) {
    return a > b ? a : b;
}

template <typename T>
void fa(T t) {
    cout << t << endl;
}


template <typename T, int n>
void print(T *a) {
    for (int i = 0; i < n; i ++) {
        cout << a[i] << ' ';
    }
    cout << endl;
}

template <typename T, typename U>
T type_cast(U u) {
    return T(u);
}




//void fa(int t) {
//    cout << t << endl;
//}



//int Max(const int& a, const int& b){
//    return a > b ? a : b;
//}
//
//double Max(const double& a, const double& b){
//    return a > b ? a : b;
//}

const char* Max(const char* a, const char* b) {
    return strcmp(a, b) > 0 ? a : b;
}

int main() {
    cout << Max<int>(3, 4) << endl;
    
    cout << Max<double>(3.14, 4.56) << endl;
    
    cout << Max<string>("abc", "acd") << endl;
    
    cout << "=========" << endl;
    cout << Max(3, 4) << endl;
    cout << Max(3.14, 5.56) << endl;
    
    cout << Max("gde", "a") << endl;
    cout << "=========" << endl;

    int a = 200;
    fa(a);
    string b = "abc";
    fa(b);
    const char* ch = "sdfdsf";
    fa(ch);
    
    cout << Max<float>(5.0f, 8.14f) << endl;
    
    int as[5] = {1, 2, 3, 4, 5};
    print<int, 5>(as);
    
    float x = type_cast<float>(3);
    cout << x << endl;
    
    return 0;
}