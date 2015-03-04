//
//  TRViewController.m
//  Day5Rotation
//
//  Created by tarena on 14-4-15.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
//    tap  pinch rotation swipe pan longpress
    
     
    
}
- (IBAction)rotationAction:(UIRotationGestureRecognizer *)sender {
    UIImageView *iv = (UIImageView*)sender.view;
    //输出两点旋转的弧度
    NSLog(@"%f",sender.rotation);
    [iv setTransform:CGAffineTransformRotate(iv.transform, sender.rotation)];
    //更新状态
    sender.rotation = 0;
    
    
}
- (IBAction)swipeAction:(UISwipeGestureRecognizer *)sender {
    NSLog(@"划了");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//当用户开始点击 移动 松手 意外的时候 都会进入到此方法
- (IBAction)panAction:(UIPanGestureRecognizer *)sender {
    UIImageView *iv = (UIImageView*)sender.view;
    CGPoint p = [sender locationInView:self.view];
    //区分究竟是哪种状态
    switch ((int)sender.state) {
        case UIGestureRecognizerStateBegan:
            
            break;
            
        case UIGestureRecognizerStateChanged:
            iv.center = p;
            break;
        case UIGestureRecognizerStateEnded:
            
            break;
        case UIGestureRecognizerStateCancelled:
            
            break;
    }
    
    
    
}

- (IBAction)longPressAction:(UILongPressGestureRecognizer *)sender {
    
    NSLog(@"长按了");
    UIImageView *iv = (UIImageView*)sender.view;
    CGPoint p = [sender locationInView:self.view];
    //区分究竟是哪种状态
    switch ((int)sender.state) {
        case UIGestureRecognizerStateBegan:
            
            break;
            
        case UIGestureRecognizerStateChanged:
            iv.center = p;
            break;
        case UIGestureRecognizerStateEnded:
            
            break;
        case UIGestureRecognizerStateCancelled:
            
            break;
    }
    
}
@end
