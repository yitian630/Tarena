//
//  TRMouse.m
//  Day17KVO2
//
//  Created by tarena on 14-5-4.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRMouse.h"

@implementation TRMouse
- (id)init
{
    self = [super init];
    if (self) {
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(addAgeAction) userInfo:Nil repeats:YES];
    }
    return self;
}

-(void)addAgeAction{
    self.age++;

}
@end
