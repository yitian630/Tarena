//
//  main.m
//  day05-2
//
//  Created by tarena on 14-3-21.
//  Copyright (c) 2014年 tarena. All rights reserved.
//
/*类与类的关系之 继承、组合*/
#import <Foundation/Foundation.h>
#import "TRComputer.h"
#import "TRCpu2.h"
#import "TRComputer2.h"
#import "TRcpu3.h"
#import "TRComputer3.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //继承
        TRComputer* com1 = [[TRComputer alloc]init];
        com1.hz = 1;
        [com1 powerOn];
        //算法
        //组合
        TRComputer2* com2 = [[TRComputer2 alloc]init];
        [com2 powerOn];
        //聚合
        TRcpu3* amd = [[TRcpu3 alloc]init];
        amd.hz = 40;
        TRComputer3* com3 = [[TRComputer3 alloc]init];
        com3.cpu = amd;
        TRcpu3* intel = [[TRcpu3 alloc]init];
        intel.hz = 80;
        com3.cpu = intel;
        [com3 powerOn];
        
    }
    return 0;
}

