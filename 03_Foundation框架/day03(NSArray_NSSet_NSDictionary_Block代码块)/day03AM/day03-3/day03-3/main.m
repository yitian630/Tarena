//
//  main.m
//  day03-3
//
//  Created by tarena on 14-3-27.
//  Copyright (c) 2014年 tarena. All rights reserved.
//
//深拷贝 浅拷贝
#import <Foundation/Foundation.h>
#import "TRStudent.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        TRStudent* stu = [TRStudent studentWithAge:18 andName:@"zhangsan"];
        TRStudent* stu2 = [TRStudent studentWithAge:19 andName:@"lisi"];
        NSArray* stus = @[stu,stu2];
        NSArray* stus2 = [[NSArray alloc]initWithArray:stus copyItems:NO];
        //NO浅拷贝
        //YES深拷贝(1.遵守协议 2.实现方法)
        NSLog(@"stus:%@",stus);
        NSLog(@"stus addr:%p",stus);
        NSLog(@"stus[0] addr:%p",stus[0]);
        NSLog(@"stus2:%@",stus2);
        NSLog(@"stus2 addr:%p",stus2);
        NSLog(@"stus2[0] addr:%p",stus2[0]);
    }
    return 0;
}

