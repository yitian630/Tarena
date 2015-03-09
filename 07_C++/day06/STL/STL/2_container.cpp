#include <iostream>
#include <vector>
using namespace std;

int main () {
    int a[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0};
    vector<int> v(a, a + 10);
    
    v.insert(++++v.begin(), 20);
    v.insert(v.end(), 30);
    
    
    v.erase(++++++++v.begin());
    v.insert(++++++++v.begin(), 20);
    
    v.clear();
    
    
    
    
    vector<int>::iterator it = v.begin();
    //遍历元素
    while (it != v.end()) {
        cout << *it << ' ';
        it++;
    }
    cout << "=======" << endl;
    //删除所有元素
    while (v.begin() != v.end()) {
        v.erase(v.begin());
    }
     cout << "=======" << endl;
    //遍历元素
    it = v.begin();
    while (it != v.end()) {
        cout << *it << ' ';
        it++;
    }
    cout << endl;
    return 0;
}