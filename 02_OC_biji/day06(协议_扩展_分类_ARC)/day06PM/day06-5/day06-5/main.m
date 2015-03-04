//
//  main.m
//  day06-5
//
//  Created by tarena on 14-3-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRFly.h"
#import "TRPerson.h"
#import "TRSuperMan.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        id<TRPerson,TRFly> p = [[TRSuperMan alloc]init];
        [p job];
        [p fly];
    }
    return 0;
}

