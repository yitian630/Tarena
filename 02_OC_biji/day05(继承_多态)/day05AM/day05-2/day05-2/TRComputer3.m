//
//  TRComputer3.m
//  day05-2
//
//  Created by tarena on 14-3-21.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRComputer3.h"

@implementation TRComputer3
-(void)powerOn{
    [self.cpu run];
    [self start];
}
-(void)start{
    NSLog(@"计算机开始运行了");
}
@end
