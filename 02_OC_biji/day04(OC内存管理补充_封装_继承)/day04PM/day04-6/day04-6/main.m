//
//  main.m
//  day04-6
//
//  Created by tarena on 14-3-20.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRCircle.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //TRCircle* circle = [[TRCircle alloc]initWithR:3];//初始化
        TRCircle* circle2 = [TRCircle circleWithR:3];//工厂方法
        //circle.r = 3;//属性
        [circle2 show];
    }
    return 0;
}

