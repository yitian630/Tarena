//
//  TRRow.m
//  Day20Game
//
//  Created by tarena on 14-5-8.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRRow.h"
#import "TRbrick.h"
@implementation TRRow

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        int blackIndex = arc4random()%4;
        for (int i=0; i<4; i++) {
        
            TRbrick *b = [[TRbrick alloc]initWithFrame:CGRectMake(i*80, 0, 80, 142)];
            //一行随机出一个黑色的
            if (blackIndex == i) {
                b.isBlack = YES;
            }
            [self addSubview:b];
        }
        
        //创建完成 row就自己移动
        [self move];
    }
    return self;
}
-(void)remove{
    [self removeFromSuperview];
    [self.timer invalidate];
}
-(void)move{
   self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0/60 target:self selector:@selector(moveAction) userInfo:Nil repeats:YES];
}
-(void)moveAction{
   TRGame *game = [TRGame shareGame];
    self.center = CGPointMake(self.center.x, self.center.y+game.gameSpeed);
    
    if (self.frame.origin.y>=568) {
        //判断是否还有黑的
        for (TRbrick *b in self.subviews) {
            if (b.isBlack) {
         
                [game gameover];
            }
        }
        
        [self reset];
    }
}

-(void)reset{
    CGRect frame = self.frame;
    frame.origin.y = self.frame.origin.y-568-142;
    self.frame = frame;
    
    int blackIndex = arc4random()%4;
    for (int i=0; i<4; i++) {
        TRbrick *b = self.subviews[i];
        if (i==blackIndex) {
            b.isBlack = YES;
        }else b.isBlack = NO;
    }
    
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
