//
//  TRSunFlower.m
//  Day1Plant
//
//  Created by tarena on 14-4-9.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRSunFlower.h"

@implementation TRSunFlower

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.plantImage = [UIImage imageNamed:@"plant_0.png"];
        self.userInteractionEnabled = YES;
    }
    return self;
}


-(void)fire{
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(addSunAction) userInfo:nil repeats:YES];
}
-(void)addSunAction{
    UIButton *sunBtn = [[UIButton alloc]initWithFrame:CGRectMake(5+arc4random()%20, 5+arc4random()%20, 25, 25)];
    [sunBtn setImage:[UIImage imageNamed:@"sun.png"] forState:UIControlStateNormal];
    [sunBtn addTarget:self action:@selector(clickedSun:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:sunBtn];
    
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(sunTimeoutAction:) userInfo:sunBtn repeats:NO];
    
    
}
-(void)sunTimeoutAction:(NSTimer *)timer{
    UIButton *sunBtn = timer.userInfo;
    
    [sunBtn removeFromSuperview];
}
-(void)clickedSun:(UIButton *)sunBtn{
    [sunBtn removeFromSuperview];
    
    int sunCount = self.vc.sunCountLabel.text.intValue;
    
    self.vc.sunCountLabel.text = [NSString stringWithFormat:@"%d",sunCount+25];
//    太阳花---》vc---》label
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
