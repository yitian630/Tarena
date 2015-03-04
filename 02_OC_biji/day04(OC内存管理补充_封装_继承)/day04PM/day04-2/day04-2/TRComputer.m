//
//  TRComputer.m
//  day04-2
//
//  Created by tarena on 14-3-20.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRComputer.h"

@implementation TRComputer
-(id)initWithTRCpu:(TRCpu*)cpu andTRMem:(TRMem*)mem{
    self = [super init];
    if (self) {
        self.cpu = cpu;//_cpu = cpu;//X
        self.mem = mem;//_mem = mem;//X
    }
    return self;
}
-(void)playGame{
    NSLog(@"playGmae Computer cpu:%d size:%d ",self.cpu.hz,self.mem.size);
}
- (void)dealloc
{
    NSLog(@"Computer cpu:%d size:%d 销毁了",self.cpu.hz,self.mem.size);
    [self.cpu release];
    [self.mem release];
    [super dealloc];
}
@end


