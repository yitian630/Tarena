//
//  TRViewController.m
//  Day6Animation
//
//  Created by tarena on 14-4-16.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *myIV;

@end

@implementation TRViewController
- (IBAction)clicked:(id)sender {
    //渐变  移动  缩放  旋转
    
//   [UIView animateWithDuration:1 animations:^{
////        self.myIV.alpha = 0.5;
////       self.myIV.center = CGPointMake(100, 300);
////       [self.myIV setTransform:CGAffineTransformScale(self.myIV.transform, 1, 2)];
//       
//       [self.myIV setTransform:CGAffineTransformRotate(self.myIV.transform, 90.0/180*M_PI)];
//       
//   }];
//    动画的位置是个虚影 不是真实的位置
    [UIView animateWithDuration:2 animations:^{
        self.myIV.center = CGPointMake(300, 300);
    } completion:^(BOOL finished) {
       [UIView animateWithDuration:1 animations:^{//写动画的代码
           self.myIV.alpha = 0.5;
       } completion:^(BOOL finished) {//动画结束之后执行
           
           [self.myIV removeFromSuperview];
       }];
        
        
        
    }];
    
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
