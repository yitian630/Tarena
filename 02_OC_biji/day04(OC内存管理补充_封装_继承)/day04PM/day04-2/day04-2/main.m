//
//  main.m
//  day04-2
//
//  Created by tarena on 14-3-20.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRComputer.h"
#import "TRCpu.h"
#import "TRMem.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        TRCpu* amdCpu = [[TRCpu alloc]init];
        amdCpu.hz = 1;
        TRMem* kmMem = [[TRMem alloc]init];
        kmMem.size = 2;
        
        TRComputer* computer = [[TRComputer alloc]init];
        computer.cpu = amdCpu;
        computer.mem = kmMem;
        [computer playGame];
        
        TRCpu* intelCpu = [[TRCpu alloc]init];
        intelCpu.hz = 2;
        TRMem* samsungMem = [[TRMem alloc]init];
        samsungMem.size = 8;
        computer.cpu = intelCpu;
        computer.mem = samsungMem;
        [computer playGame];
        
        [amdCpu release];
        [kmMem release];
        [intelCpu release];
        [samsungMem release];
        [computer release];
    }
    return 0;
}

