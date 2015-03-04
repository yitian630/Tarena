//
//  main.m
//  day03-6
//
//  Created by tarena on 14-3-27.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRPoint.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        TRPoint* point1 = [TRPoint pointWithX:3 andY:5];
        TRPoint* point2 = [TRPoint pointWithX:3 andY:6];
        TRPoint* point3 = [TRPoint pointWithX:3 andY:5];
        NSMutableSet* set = [NSMutableSet setWithObjects:point1,point2,point3, nil];
        //NSLog(@"set:%@",set);
        for (TRPoint* p in set) {
            NSLog(@"x:%d y:%d",p.x,p.y);
        }
        
        NSEnumerator* enumerator = [set objectEnumerator];
        TRPoint* p3;
        while ((p3=[enumerator nextObject])!=nil) {
            NSLog(@"x:%d y:%d",p3.x,p3.y);
        }
        
        
    }
    return 0;
}

