//
//  TRDrawView.m
//  Day6DrawLine
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
        self.points = [NSMutableArray array];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//当控件显示的时候会调用一次
- (void)drawRect:(CGRect)rect
{
//    1.得到一个画布
    CGContextRef context = UIGraphicsGetCurrentContext();
    //2.设置线的宽度为3个像素
//    CGContextSetLineWidth(context, 5);
    //设置线颜色
//    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    
    for (int i=0; i<self.points.count; i++) {
        CGPoint p = [self.points[i] CGPointValue];
        if (i==0) {
            //3.把画笔移动到某一个点
    CGContextMoveToPoint(context, p.x, p.y);
        }else{
            //4.添加一条线到某一个点
        CGContextAddLineToPoint(context, p.x, p.y);
        }
        
    }
 
   
 
//    5.执行绘制代码 fill填充 storke描边 FillStroke既填充又描边
    CGContextDrawPath(context, kCGPathStroke);
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *t = [touches anyObject];
    CGPoint p = [t locationInView:self];
    
    [self.points addObject:[NSValue valueWithCGPoint:p]];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *t = [touches anyObject];
    CGPoint p = [t locationInView:self];
    
    [self.points addObject:[NSValue valueWithCGPoint:p]];
    //手动调用绘制代码
    [self setNeedsDisplay];
}





@end
