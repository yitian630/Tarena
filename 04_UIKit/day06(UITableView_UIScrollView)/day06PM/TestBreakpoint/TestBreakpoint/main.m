//
//  main.m
//  TestBreakpoint
//
//  Created by tarena on 14-4-8.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        int sum = 0;
        for(int i=1; i<100; i+=2){
            sum += i;
        }
        NSLog(@"sum=%d", sum);
    }
    return 0;
}

