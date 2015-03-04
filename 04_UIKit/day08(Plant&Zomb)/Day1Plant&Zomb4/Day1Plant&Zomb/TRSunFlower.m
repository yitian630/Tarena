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
       //打开交互
        self.userInteractionEnabled = YES;
    }
    return self;
}


-(void)fire{
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(addSunAction) userInfo:nil repeats:YES];
}
-(void)addSunAction{
   //太阳花是可以点击的，用button
    UIButton *sunBtn = [[UIButton alloc]initWithFrame:CGRectMake(5+arc4random()%20, 5+arc4random()%20, 25, 25)];
   //给button设置图片
    [sunBtn setImage:[UIImage imageNamed:@"sun.png"] forState:UIControlStateNormal];
   //添加点击事件
    [sunBtn addTarget:self action:@selector(clickedSun:) forControlEvents:UIControlEventTouchUpInside];
   //加入到当前视图
    [self addSubview:sunBtn];
    
    
}
-(void)clickedSun:(UIButton *)sunBtn{
    [sunBtn removeFromSuperview];
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
