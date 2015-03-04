//
//  main.m
//  day04-3
//
//  Created by tarena on 14-3-20.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRStudent.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        /*
         //初始化方法创建对象，在MRC模式下要加release
        TRStudent* stu = [[[TRStudent alloc]init]autorelease];
        stu.age = 18;
        NSLog(@"第二个autoreleasepool");
        @autoreleasepool {
            TRStudent* stu2 = [[[TRStudent alloc]init]autorelease];
            stu2.age = 28;
        }
        //autorelease将对象放进自动释放池管理
        TRStudent* stu3 = [[[TRStudent alloc]init]autorelease];
        stu3.age = 38;
        //[stu release];
        
         */
        
        TRStudent* stu4 = [TRStudent student];
        NSLog(@"自动释放池末尾");
    }//池结束 会向池中的对象发送release消息
    NSLog(@"程序结束了");
    return 0;
}

