//
//  TRMem.m
//  day04-2
//
//  Created by tarena on 14-3-20.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRMem.h"

@implementation TRMem
- (void)dealloc
{
    NSLog(@"内存 size:%d 销毁了",self.size);
    [super dealloc];
}
@end
