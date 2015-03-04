//
//  TRComputer.m
//  day05-2
//
//  Created by tarena on 14-3-21.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRComputer.h"

@implementation TRComputer
-(void)powerOn{
    [self run];
    [self start];
}
-(void)start{
    NSLog(@"进行操作系统开始操作计算机");
}
@end
