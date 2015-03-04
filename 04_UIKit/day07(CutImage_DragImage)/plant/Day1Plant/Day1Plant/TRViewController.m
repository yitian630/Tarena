//
//  TRViewController.m
//  Day1Plant
//
//  Created by tarena on 14-4-9.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRPlant.h"
@interface TRViewController ()

@end

@implementation TRViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    TRPlant *p = [[TRPlant alloc]initWithFrame:CGRectMake(100, 100, 60, 100)];
    
    [self.view addSubview:p];
    
}



@end
