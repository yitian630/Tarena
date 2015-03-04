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
-(void)move{
    [NSTimer scheduledTimerWithTimeInterval:.01 target:self selector:@selector(moveAction) userInfo:Nil repeats:YES];
}
-(void)moveAction{
    self.center = CGPointMake(self.center.x, self.center.y+1);
    
    if (self.frame.origin.y>=568) {
        CGRect frame = self.frame;
        frame.origin.y = -142;
        self.frame = frame;
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
