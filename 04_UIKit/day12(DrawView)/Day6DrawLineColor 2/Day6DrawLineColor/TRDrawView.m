//
//  TRDrawView.m
//  Day6DrawLineColor
//
//  Created by tarena on 14-4-16.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRDrawView.h"
#import "TRLine.h"
@implementation TRDrawView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.width = 1;
        self.lines = [NSMutableArray array];
        self.deleteLines = [NSMutableArray array];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for (TRLine *line in self.lines) {
        CGContextSetStrokeColorWithColor(context, line.color.CGColor);
        CGContextSetLineWidth(context, line.width);
        for (int i=0; i<line.points.count; i++) {
            CGPoint p = [line.points[i]CGPointValue];
            if (i==0) {
                CGContextMoveToPoint(context, p.x, p.y);
                
            }else{
                CGContextAddLineToPoint(context, p.x, p.y);
            }
        }
        //绘制每一条线的时候都要执行一次
        CGContextDrawPath(context, kCGPathStroke);
    }
   
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //清空恢复的数组
    [self.deleteLines removeAllObjects];
    
    UITouch *t = [touches anyObject];
    CGPoint p = [t locationInView:self];
    self.line = [[TRLine alloc]init];
    self.line.color = self.color;
    self.line.width = self.width;
    
    [self.lines addObject:self.line];
    [self.line.points addObject:[NSValue valueWithCGPoint:p]];
    
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *t = [touches anyObject];
    CGPoint p = [t locationInView:self];
    
     [self.line.points addObject:[NSValue valueWithCGPoint:p]];
    
    //刷新显示 相当于手动调用drawRect
    [self setNeedsDisplay];
}


@end
