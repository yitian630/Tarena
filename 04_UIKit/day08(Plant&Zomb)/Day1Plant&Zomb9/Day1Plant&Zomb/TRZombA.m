//
//  TRZombA.m
//  Day1CutImage
//
//  Created by tarena on 14-4-9.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRZombA.h"

@implementation TRZombA

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.zombImage = [UIImage imageNamed:@"zomb_0.png"];
        self.speed = .5;
        self.HP = 5;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
