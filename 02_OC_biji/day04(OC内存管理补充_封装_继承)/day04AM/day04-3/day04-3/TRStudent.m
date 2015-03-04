//
//  TRStudent.m
//  day04-3
//
//  Created by tarena on 14-3-20.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRStudent.h"

@implementation TRStudent
//工厂方法通常都实例了autorelease
//通过工厂方法得到的对象就不需要release
+(id)student{
    return [[[TRStudent alloc]init]autorelease];
}
-(void)dealloc{
    NSLog(@"student age:%d 销毁了",self.age);
    [super dealloc];
}
@end
