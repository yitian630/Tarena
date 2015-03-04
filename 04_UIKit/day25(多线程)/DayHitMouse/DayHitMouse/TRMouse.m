//
//  TRMouse.m
//  DayHitMouse
//
//  Created by tarena on 14-5-6.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRMouse.h"

@implementation TRMouse

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        //设置老鼠时间的初始值
        [self setTitle:@"3" forState:UIControlStateNormal];
        //开启子线程 去做睡眠的耗时操作
        [NSThread detachNewThreadSelector:@selector(countDownAction) toTarget:self withObject:Nil];
        
    }
    return self;
}

-(void)countDownAction{
    
    for (int i=0; i<3; i++) {
        [NSThread sleepForTimeInterval:.5];
        //操作界面的代码要放在主线程里面
        [self performSelectorOnMainThread:@selector(updateTitle) withObject:Nil waitUntilDone:NO];
    }
    
    //时间到了 删除掉老鼠
    [self removeFromSuperview];
    
}

-(void)updateTitle{
    int currentTime = [[self titleForState:UIControlStateNormal]intValue];
    
    [self setTitle:[NSString stringWithFormat:@"%d",currentTime-1] forState:UIControlStateNormal];
    
    
    
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
