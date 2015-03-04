//
//  main.m
//  day03-5
//
//  Created by tarena on 14-3-27.
//  Copyright (c) 2014年 tarena. All rights reserved.
//
/*NSSet集合*/
#import <Foundation/Foundation.h>
#import "TRStudent.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        TRStudent* stu = [[TRStudent alloc]init];
        stu.age = 18;
        stu.name = @"zhangsan";
        TRStudent* stu2 = [[TRStudent alloc]init];
        stu2.age = 18;
        stu2.name = @"lisi";
        TRStudent* stu3 = [[TRStudent alloc]init];
        stu3.age = 18;
        stu3.name = @"zhangsan";
        /*
        long stuHash = [stu hash];
        NSLog(@"stuHash:%ld",stuHash);
        long stuHash2 = [stu2 hash];
        NSLog(@"stuHash2:%ld",stuHash2);
         */
        NSMutableSet* set = [[NSMutableSet alloc]init];
        [set addObject:stu];
        [set addObject:stu2];
        [set addObject:stu3];
        NSLog(@"set:%@",set);
    }
    return 0;
}

