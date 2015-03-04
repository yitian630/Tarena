//
//  TRWaitingView.m
//  Day9CustomView
//
//  Created by tarena on 14-4-21.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRWaitingView.h"

@implementation TRWaitingView
- (IBAction)clicked:(id)sender {
    NSLog(@"点击了按钮");
}
//通过xib加载控件的话会调用此方法
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        //设置圆角
        self.layer.cornerRadius = 10;
    }
    return self;
}
//通过代码创建控件
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
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
