//
//  TRDrawView.m
//  Day6Draw2
//
//  Created by tarena on 14-4-16.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRDrawView.h"

@implementation TRDrawView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //设置阴影
    CGContextSetShadowWithColor(context, CGSizeMake(10, 10), 10, [UIColor cyanColor].CGColor);
    
    //绘制线
    CGContextMoveToPoint(context, 100, 100);
    CGContextAddLineToPoint(context, 200, 200);
    CGContextDrawPath(context, kCGPathStroke);
    //绘制矩形
    CGContextAddRect(context, CGRectMake(100, 50, 100, 100));
    CGContextDrawPath(context, kCGPathStroke);
    //绘制椭圆形
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetLineWidth(context, 5);
    CGContextAddEllipseInRect(context, CGRectMake(100, 50, 100, 100));
    CGContextDrawPath(context, kCGPathFillStroke);
    //绘制扇形
    CGContextMoveToPoint(context, 100, 300);
// x.y代表圆心 100为半径 开始弧度 结束弧度 最后一个参数 顺逆时针 0代表顺时针
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:97.0/255 green:145.0/255 blue:17.0/255 alpha:1].CGColor);
    CGContextAddArc(context, 100, 300, 100, 0, 90.0/180.0*M_PI, 1);
    CGContextDrawPath(context, kCGPathFill);
  //绘制图片
    UIImage *image = [UIImage imageNamed:@"yangmi10.jpg"];
    [image drawInRect:CGRectMake(200, 280, 100, 100)];
    //绘制文本
    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    NSString *str = @"Hello Tarena!";
    
    [str drawAtPoint:CGPointMake(50, 200) withFont:[UIFont fontWithName:@"Zapfino" size:30]];
}
 

@end
