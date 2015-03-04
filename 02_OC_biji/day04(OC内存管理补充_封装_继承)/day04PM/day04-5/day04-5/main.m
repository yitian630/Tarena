//
//  main.m
//  day04-5
//
//  Created by tarena on 14-3-20.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRDog.h"
#import "TRCat.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //两个类之间有关系 继承关系
        //子类可以拥有父类的属性和方法
        TRDog* dog = [[TRDog alloc]init];
        TRCat* cat = [[TRCat alloc]init];
        //必须是继承关系
        [dog eat];//子类可以继承父类的属性或方法 代码复用性
        //子类重写了父类的方法 优先调用子类的方法 方法的重写
        [dog shout];
        [cat shout];
    }
    return 0;
}

