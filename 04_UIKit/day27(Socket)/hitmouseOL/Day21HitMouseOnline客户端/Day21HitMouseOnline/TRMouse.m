//
//  TRMouse.m
//  Day12HitMouse
//
//  Created by tarena on 14-4-25.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRMouse.h"

@implementation TRMouse

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        [self addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
        [self setTitle:@"3" forState:UIControlStateNormal];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(timeoutAction:) userInfo:Nil repeats:YES];
    }
    return self;
}

-(void)timeoutAction:(NSTimer*)timer{
    int time = [[self titleForState:UIControlStateNormal]intValue];
    [self setTitle:[NSString stringWithFormat:@"%d",--time] forState:UIControlStateNormal];
    if (time==0) {
        [timer invalidate];
        [self removeFromSuperview];
        
        
        
        
            self.delegate.failCountLabel.text = [NSString stringWithFormat:@"%d",self.delegate.failCountLabel.text.intValue+1];
        
        int failCount = self.delegate.failCountLabel.text.intValue;
        
        if (failCount == 10) {
            [self.delegate gameover];
        }
    }
    
}
-(void)clicked{
    
    [self.timer invalidate];
    self.delegate.successLabel.text = [NSString stringWithFormat:@"%d",self.delegate.successLabel.text.intValue+1];
    [self removeFromSuperview];
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
