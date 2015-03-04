//
//  TRZombD.m
//  Day1CutImage
//
//  Created by tarena on 14-4-9.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRZombD.h"

@implementation TRZombD

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.zombImage = [UIImage imageNamed:@"zomb_3.png"];
       self.speed = 1;
    }
    return self;
}
 

@end
