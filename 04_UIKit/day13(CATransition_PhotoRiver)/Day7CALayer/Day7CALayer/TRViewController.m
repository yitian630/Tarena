//
//  TRViewController.m
//  Day7CALayer
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
	UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    iv.image = [UIImage imageNamed:@"2005122622434846.jpg"];
    [self.view addSubview:iv];
    //添加边框
    iv.layer.borderWidth = 3;
    iv.layer.borderColor = [UIColor greenColor].CGColor;
//    iv.layer.cornerRadius = 50;
//    iv.layer.masksToBounds = YES;//超出边框范围不显示
    
    //添加阴影
    iv.layer.shadowOffset = CGSizeMake(-10, 10);
    iv.layer.shadowOpacity = .8;//阴影的浓度 0-1
    iv.layer.shadowRadius = 5;//阴影的范围
    iv.layer.shadowColor = [UIColor redColor].CGColor;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
