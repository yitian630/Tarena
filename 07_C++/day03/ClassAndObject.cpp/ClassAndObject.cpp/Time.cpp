//
//  Time.cpp
//  ClassAndObject.cpp
//
//  Created by tarena on 14-6-3.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#include "Time.h"


Time::Time(int h, int m, int s) : hour(h), min(m), sec(s){
    cout << "Time::Time(int h, int m, int s)" << endl;
};

void Time::dida() {
    sec++;
    if (sec == 60) {
        sec = 0;
        min++;
    }
    if (min == 60) {
        min = 0;
        hour++;
    }
    if (hour == 24) {
        hour = 0;
    }
}

void Time::show() {
     cout << hour << ':' << min << ':' << sec << endl;
}

void Time::run() {
    while (1) {
        show();
        dida();
        //获取系统时间
        time_t cur = time(0);
        while (cur == time(0));
    }
}

