//
//  main.m
//  day01
//
//  Created by tarena on 14-3-25.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //类放在代码区 对象放在堆中
        TRStudent* stu = [TRStudent alloc];
        stu.age = 18;
        //浅复制
        TRStudent* stu2 = stu;//复制引用
        NSLog(@"stu address:%p",stu);
        NSLog(@"stu2 address:%p",stu2);
        //copy 复制对象 深复制
        //1.遵守协议NSCopying
        //2.实现copyWithZone方法
        /* @protocol协议选择器
        Protocol* p = @protocol(NSCopying);
        //判断类是否遵守某个协议
         //保证代码的安全性
        if ([TRStudent conformsToProtocol:p]) {
            TRStudent* stu3 = [stu copy];
        }
         */
        TRStudent* stu3 = [stu copy];
        NSLog(@"stu3 address:%p",stu3);
        NSLog(@"stu3 age:%d",stu3.age);
        
        //学生拥有一本书
        TRBook* book = [[TRBook alloc]initWithPrice:18.5];
        stu.book = book;//copy
        NSLog(@"book address:%p",book);
        NSLog(@"stu.book address:%p",stu.book);
    }
    return 0;
}

