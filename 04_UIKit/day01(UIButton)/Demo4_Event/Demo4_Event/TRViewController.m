//
//  TRViewController.m
//  Demo4_Event
//
//  Created by tarena on 14-3-28.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property(strong,nonatomic)UILabel *label;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	UILabel *label = [[UILabel alloc]init];
    self.label = label;
    label.text = @"我是一个Label";
    label.frame = CGRectMake(30, 50, 240, 30);
    label.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:label];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"改Label的内容" forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 200, 100, 45);
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(changeLabel) forControlEvents:UIControlEventTouchUpInside];
}

- (void)changeLabel
{
    //改Label的内容
    self.label.text = @"我的内容被改了";
}


@end
