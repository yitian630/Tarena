//
//  TRViewController.m
//  Day7JumpPage
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
	 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    CATransition *animation = [CATransition animation];
    animation.type = @"oglFlip";
    animation.subtype = @"fromLeft";
    animation.duration = 1;
//    NSLog(@"%@",self.view.superview.superview.superview.superview);
    //得到window添加动画
    [self.view.superview.superview.superview.superview.layer addAnimation:animation forKey:Nil];
    
}


@end
