//
//  TRCpu.m
//  day04-2
//
//  Created by tarena on 14-3-20.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRCpu.h"

@implementation TRCpu
- (void)dealloc
{
    NSLog(@"Cpu hz:%d 销毁了",self.hz);
    [super dealloc];
}
@end



