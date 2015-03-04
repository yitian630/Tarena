//
//  TRPerson+TREquipment.m
//  day06-2
//
//  Created by tarena on 14-3-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRPerson+TREquipment.h"

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



