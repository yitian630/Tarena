//
//  main.m
//  day04-4
//
//  Created by tarena on 14-3-20.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
       TRStudent* stu = [[TRStudent alloc]init];
        //stu->_age = 10;
        stu->i = 20;//可以在所有文件中访问
        stu->i2 =30;//同一个包是可以访问的
//        stu->i3 = 40;//本类或子类...
//        stu->i4;//只能本类访问
        [stu showI];
    }
    return 0;
}

