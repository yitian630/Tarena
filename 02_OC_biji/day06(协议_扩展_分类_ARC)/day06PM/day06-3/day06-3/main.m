//
//  main.m
//  day06-3
//
//  Created by tarena on 14-3-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//
/*分类*/
#import <Foundation/Foundation.h>
#import "TRPerson+TREquiptment.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        TRPerson* person = [[TRPerson alloc]init];
        [person job];//本身具备的能力
        [person fly];//分类增强的能力，但类的本质没有任何变量
        //[person addMethod];//扩展增强了类的能力，但是是私有能力，不可以在类的外部使用
        [person addMethod2];//通过协议给类添加能力，类的本质发生变化
        
        //协议引用指向遵守了协议的对象
        id<TRSpider> sp =[[TRPerson alloc]init];
        [sp addMethod2];//只能向对象发送协议消息
        
    }
    return 0;
}

