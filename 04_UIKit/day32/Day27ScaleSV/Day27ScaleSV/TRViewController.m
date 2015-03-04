//
//  TRViewController.m
//  Day27ScaleSV
//
//  Created by tarena on 14-5-17.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRScaleScrollView.h"
@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	TRScaleScrollView *ssv = [[TRScaleScrollView alloc]initWithFrame:CGRectMake(100, 100, 200, 150) andImage:[UIImage imageNamed:@"xiaoqingxin03.jpg"]];
    
    [self.view addSubview:ssv];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
