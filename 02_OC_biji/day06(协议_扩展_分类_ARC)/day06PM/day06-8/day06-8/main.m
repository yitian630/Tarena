//
//  main.m
//  day06-8
//
//  Created by tarena on 14-3-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//
//弱引用
#import <Foundation/Foundation.h>
#import "TRStudent.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //默认是弱引用
        __weak TRStudent* stu2;//0
        if(1==1){
            __strong TRStudent* stu = [[TRStudent alloc]init];//+1
            stu2 = stu;//没有retain
            //引用计数器不会自动加1
            [stu2 study];
            [stu study];
            NSLog(@"代码块结尾");
        }//自动 release -1
        //自动置零操作
        NSLog(@"stu2 address:%p",stu2);
        [stu2 study];
    }
    NSLog(@"程序结尾");
    return 0;
}

