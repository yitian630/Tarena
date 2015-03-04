
//
//  TRPerson.m
//  Day17KVC
//
//  Created by tarena on 14-5-4.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRPerson.h"

@implementation TRPerson
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
    
//    //发出通知
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"changeAge" object:@(self.age)];
    
}




@end
