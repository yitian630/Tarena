//
//  TRCircle.m
//  day04-6
//
//  Created by tarena on 14-3-20.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRCircle.h"

@implementation TRCircle
+(id)circleWithR:(float)r{
    return [[[TRCircle alloc]initWithR:r]autorelease];
}
-(id)initWithR:(float)r{
    self = [super init];
    if (self) {
        self.r = r;
    }
    return self;
}
-(float)perimeter{
    return 2*3.14*self.r;
}
-(float)area{
    return 3.14*self.r*self.r;
}

@end





