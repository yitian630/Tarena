//
//  TRViewController.m
//  Day7Transition
//
//  Created by tarena on 14-4-17.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UIView *littleView;

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(changeImage) userInfo:Nil repeats:YES];
}

-(void)changeImage{
    
    CATransition *animation = [CATransition animation];
    //动画类型
//    fade moveIn  push  reveal
//    cube suckEffect oglFlip rippleEffect pageCurl pageUnCurl cameraIrisHollowOpen cameraIrisHollowClose
    
    
    animation.type = @"oglFlip";
    animation.subtype = @"fromRight";//控制动画的方向`fromLeft', `fromRight', `fromTop' and `fromBottom'
    animation.duration = 1;
    animation.delegate = self;
    [self.littleView.layer addAnimation:animation forKey:@"animation"];
    
//e a b c d
//0  4
//1  4
//2  4
//3  4
//0  4
    
    //改变子视图的位置
     [self.littleView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
