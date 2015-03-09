#include <iostream>
#include <vector>
using namespace std;

int main () {
    
    vector<int> v;
    //区间构造  就是在内存中找个开始 和 结束位置的区间， 通过区间来创建一个容器
    int a[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0};
    vector<int> v2(a, a + 10);
    
    vector<int>::iterator it = v2.begin();
  
    while (it != v2.end()) {
        cout << *it << ' ';
        it++;
    }
    cout << endl;

    
    //reverse_iterator 反向迭代器
    //v2.rbegin()  返回一个反向迭代器对象，指向了容器中的最后一个元素
    //v2.rend()  返回一个反向迭代器对象，指向了容器中的第一个元素的上一个元素
    vector<int>::reverse_iterator it2 = v2.rbegin();
    while (it2 != v2.rend()) {
        cout << *it2 << ' ';
        it2++;
    }
    cout << endl;
    
    return 0;
}





