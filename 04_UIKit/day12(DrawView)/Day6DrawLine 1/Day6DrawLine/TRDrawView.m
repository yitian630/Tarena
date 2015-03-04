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
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
//    1.得到一个画布
    CGContextRef context = UIGraphicsGetCurrentContext();
    //2.设置线的宽度为3个像素
//    CGContextSetLineWidth(context, 5);
    //设置线颜色
//    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    //3.把画笔移动到某一个点
    CGContextMoveToPoint(context, 100, 100);
    //4.添加一条线到某一个点
    CGContextAddLineToPoint(context, 200, 200);
//    5.执行绘制代码 fill填充 storke描边 FillStroke既填充又描边
    CGContextDrawPath(context, kCGPathStroke);
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
}





@end
