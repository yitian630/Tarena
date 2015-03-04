//
//  main.m
//  day06-7
//
//  Created by tarena on 14-3-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"
int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        //默认是强引用
        TRStudent* stu2;//0
        if(1==1){
            __strong TRStudent* stu = [[TRStudent alloc]init];//+1
            stu2 = stu;//自动retain +1
            [stu study];
            NSLog(@"代码块结尾");
        }//自动 release -1
        [stu2 study];
    }//自动 release -1
    NSLog(@"程序结尾");
    return 0;
}

