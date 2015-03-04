//
//  TRLine.m
//  Day6DrawLineColor
//
//  Created by tarena on 14-4-16.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRLine.h"

@implementation TRLine
- (id)init
{
    self = [super init];
    if (self) {
        self.points = [NSMutableArray array];
    }
    return self;
}
@end
