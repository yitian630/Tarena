//
//  TRComputer2.m
//  day05-2
//
//  Created by tarena on 14-3-21.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRComputer2.h"

@implementation TRComputer2
-(id)init{
    self = [super init];
    if (self) {
        _cpu = [[TRCpu2 alloc]init];
        _cpu.hz = 20;
    }
    return self;
}
-(void)powerOn{
    [_cpu run];
    [self start];
}
-(void)start{
    NSLog(@"计算机开始运行");
}
@end





