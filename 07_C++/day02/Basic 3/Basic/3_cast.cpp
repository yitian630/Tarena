#include <iostream>
using namespace std;

int main() {
    double pi = 3.1415926;
    int x = static_cast<int>(pi);
    cout << x << endl;
    void *pc = new long(123);
    long *pl = static_cast<long*>(pc);
    cout << *pl << endl;
    //不能转换 因为static_cast在检查的时候，法相 long* 转换 double* 是一个不合理的转换
//    double *pd = static_cast<double*>(pl);
    
    //reinterpret_cast 比较强悍， 不会进行类型检查， 你想转它就给你转， 但是后果自负, 重新解释该片内存空间
    double *pd = reinterpret_cast<double*>(pl);
    cout << *pl  << "===" << *pd << endl;
    
    //去掉  cv 限制
    volatile const int a = 100; //编译器已经自认为后面的a不可能被修改
    //&a   const int*
    int *a1 = const_cast<int*>(&a);
    *a1 = 200;
    cout << "a = " << a << endl;
    
    
    //大多数情况 我们开发中还是使用 强转
    float f = 3.13f;
    int x1 = (int)f;
 
    
    return 0;
}