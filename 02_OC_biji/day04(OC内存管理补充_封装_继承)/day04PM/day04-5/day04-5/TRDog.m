//
//  TRDog.m
//  day04-5
//
//  Created by tarena on 14-3-20.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRDog.h"

@implementation TRDog
//方法的重写 返回值类型相同 方法名相同 参数类型相同
-(void)shout{
    NSLog(@"汪汪汪");
}
-(void)eat{
    NSLog(@"狗可以吃骨头/肉");
}
-(void)dealloc{
    NSLog(@"dealloc");
}
@end





