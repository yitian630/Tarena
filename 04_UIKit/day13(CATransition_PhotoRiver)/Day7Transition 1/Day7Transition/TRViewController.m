//
//  TRViewController.m
//  Day7Transition
//
//  Created by tarena on 14-4-17.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

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
//    cube suckEffect olgFilp rippleEffect pageCurl pageUnCurl cameraIrisHollowOpen cameraIrisHollowClose
    
    
    animation.type = @"cameraIrisHollowClose";
    animation.subtype = @"fromRight";//控制动画的方向`fromLeft', `fromRight', `fromTop' and `fromBottom'
    animation.duration = 1;
    animation.delegate = self;
    [self.view.layer addAnimation:animation forKey:@"animation"];
    

    //改变子视图的位置
     [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
