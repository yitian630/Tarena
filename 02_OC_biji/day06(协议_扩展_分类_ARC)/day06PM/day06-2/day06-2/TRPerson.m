//
//  TRPerson.m
//  day06-2
//
//  Created by tarena on 14-3-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRPerson.h"
//#import "TRPerson_TRExtension.h"
@interface TRPerson () //声明一个扩展
-(void)addExtentionMethod;
@end
@implementation TRPerson
-(void)addSpider{
    NSLog(@"添加了一个蜘蛛的能力");
}
-(void)addExtentionMethod{
    NSLog(@"addExtentionMethod");
}
-(void)job{
    //NSLog(@"age:%d",self.age);
    NSLog(@"人类具有工作的能力");
}
@end

@implementation TRPerson (TREquipment)
-(void)fly{
    //NSLog(@"_age:%d",_age);//不能访问实例变量
    NSLog(@"age:%d",self.age);
    NSLog(@"添加了飞行的能力");
}
-(void)fire{
    NSLog(@"添加了攻击的能力");
}
@end