//
//  TRViewController.m
//  Day10TRLabel
//
//  Created by tarena on 14-4-23.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "RTLabel.h"
@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	RTLabel *label = [[RTLabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    label.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:label];
    label.text = @"aosidjfaopsdifjaosdifjaosdifja";
    NSLog(@"文本高度:%f",label.optimumSize.height);
//    label.frame = CGRectMake(100, 100, 100, label.optimumSize.height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
