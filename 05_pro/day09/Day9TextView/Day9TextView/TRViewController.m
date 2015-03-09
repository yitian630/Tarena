//
//  TRViewController.m
//  Day9TextView
//
//  Created by tarena on 14-5-28.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRTextView.h"
@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	 
    TRTextView *tv = [[TRTextView alloc]initWithFrame:CGRectMake(100, 100, 200, 100)];
    [self.view addSubview:tv];
    tv.text = @"oasd";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
