//
//  TRMouse.m
//  Mouse
//
//  Created by tarena on 14-3-29.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRMouse.h"
@interface TRMouse ()
@property (nonatomic,strong)NSTimer *timer;
@end

@implementation TRMouse

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor redColor]];
        [self setTitle:@"3" forState:UIControlStateNormal];
        [self addTarget:self action:@selector(deleteMouse) forControlEvents:UIControlEventTouchUpInside];

        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    }
    return self;
}

-(void)deleteMouse{
    [self removeFromSuperview];
    [self.timer invalidate];
}

-(void)updateTime {
    int count = [self.titleLabel.text intValue];
    if (count==0) {
        [self deleteMouse];
    }
    [self setTitle:[NSString stringWithFormat:@"%d",--count] forState:UIControlStateNormal];
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
