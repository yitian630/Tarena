//
//  TRViewController.m
//  Day6DrawLine
//
//  Created by tarena on 14-4-16.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRDrawView.h"
@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    TRDrawView *dv = [[TRDrawView alloc]initWithFrame:self.view.bounds];
    [dv setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:dv];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
