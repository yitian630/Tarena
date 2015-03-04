//
//  TRFirstViewController.m
//  Demo2_ViewController
//
//  Created by tarena on 14-3-28.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRFirstViewController.h"

@interface TRFirstViewController ()

@end

@implementation TRFirstViewController
//当当前控制器被加载时调用
- (void)viewDidLoad
{
    [super viewDidLoad];
    
	UILabel *label = [[UILabel alloc]init];
    label.text = @"Hello, My First App.";
    label.frame = CGRectMake(10, 50, 200, 30);
    self.view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:label];
}
@end
