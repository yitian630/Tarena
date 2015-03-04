//
//  TRViewController.m
//  Demo3_UIButton
//
//  Created by tarena on 14-3-28.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

@end

@implementation TRViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"确定"
            forState:UIControlStateNormal];
    [button setTitle:@"被按下"
            forState:UIControlStateHighlighted];
    button.frame = CGRectMake(20, 20, 100, 40);
    button.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button];
    
    
    [button addTarget:self action:@selector(buttonTap) forControlEvents:UIControlEventTouchUpInside];
    //添加TouchDown,TouchUpOutside事件处理
    [button addTarget:self action:@selector(buttonTap2) forControlEvents:UIControlEventTouchDown];
    [button addTarget:self action:@selector(buttonTap3) forControlEvents:UIControlEventTouchUpOutside];
}

- (void)buttonTap
{
    NSLog(@"我被按了一下");
}

- (void)buttonTap2
{
    NSLog(@"我是2");
}

- (void)buttonTap3
{
    NSLog(@"我是3");
}

@end
