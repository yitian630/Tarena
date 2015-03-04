//
//  TRViewController.m
//  Day1MoveImage
//
//  Created by tarena on 14-4-9.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (nonatomic, strong)UIImageView *iv;
@property (nonatomic)BOOL isTouched;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.iv = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
    self.iv.image = [UIImage imageNamed:@"bullet_0.png"];
    [self.view addSubview:self.iv];
    
}

//开始触摸屏幕的时候
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //从set数组中取到任意对象
    UITouch *touch = [touches anyObject];
    //取到相对于整个屏幕的点的坐标
    CGPoint p = [touch locationInView:self.view];
    //判断有没有点着某一个控件
    if (CGRectContainsPoint(self.iv.frame, p)) {
        NSLog(@"点着图片了");
        self.isTouched = YES;
    }else{
        NSLog(@"没有点着");
        self.isTouched = NO;
    }
    
}
//手指在屏幕上面移动的时候
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    //从set数组中取到任意对象
    UITouch *touch = [touches anyObject];
    //取到相对于整个屏幕的点的坐标
    CGPoint p = [touch locationInView:self.view];
    if (self.isTouched) {
       self.iv.center = p;
    }
    
    
    
}
//手势离开屏幕的时候
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
}
//当打进电话的时候或者状态栏被拖下来的时候会执行
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
