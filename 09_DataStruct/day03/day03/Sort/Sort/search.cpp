//
//  main.cpp
//  Sort
//
//  Created by tarena on 14-6-27.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#include <iostream>
using namespace std;

//循环实现
template <typename T>
int mySearch(T *ts, int n, const T& d) {
    int L = 0;
    int R = n - 1;
    while (L <= R) {
        int M = (L + R)/2;
        if (ts[M] == d) return M;
        if (ts[M] < d)
            L = M+1;
        else
            R = M - 1;
    }
    return -1;
}


//递归实现
template <typename T>
int mySearch(T *ts, int from, int to, const T& d) {
    if (from > to)
        return -1;
    int mid = (from + to) / 2;
    if (ts[mid] == d)
        return mid;
    if (ts[mid] < d)
        mySearch(ts, mid+1, to, d);
    if (ts[mid] > d)
        mySearch(ts, from, mid-1, d);
    return -1;
}

template <typename T>
int _mySearch(T *ts, int n, const T& d) {
    return mySearch(ts, 0, n, d);
}


int main()
{
    char cs[6] = {'*','A','B','C','D','E'};
    cout << mySearch(cs, 6, '*') << endl;
    cout << mySearch(cs, 6, 'A') << endl;
    cout << mySearch(cs, 6, 'D') << endl;
    cout << mySearch(cs, 6, 'C') << endl;
    cout << "=============" << endl;
     cout << _mySearch(cs, 6, 'C') << endl;
}




