//
//  TRStudent.m
//  day01
//
//  Created by tarena on 14-3-25.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRStudent.h"

@implementation TRStudent
-(id)initWithAge:(int)age{
    if (self = [super init]) {
        self.age = age;
    }
    return self;
}
//不但要复制对象的空间 还要复制对象的值
/*
-(id)copyWithZone:(NSZone *)zone{
    return [[TRStudent alloc]initWithAge:self.age];
}
 */
//类的加载，自动调用+load方法
+(void)load{
    NSLog(@"load ...");
}
//第一次使用类时，自动调用+initialize方法
+(void)initialize{
    NSLog(@"initialize ...");
}
@end





