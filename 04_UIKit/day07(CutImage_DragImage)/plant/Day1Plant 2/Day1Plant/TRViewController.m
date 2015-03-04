//
//  TRViewController.m
//  Day1Plant
//
//  Created by tarena on 14-4-9.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRPlant.h"
#import "TRSunFlower.h"
#import "TRPea.h"
#import "TRIcePea.h"
#import "TRNut.h"
@interface TRViewController ()

@end

@implementation TRViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    TRSunFlower *sf = [[TRSunFlower alloc]initWithFrame:CGRectMake(100, 100, 60, 100)];
    [self.view addSubview:sf];
    TRPea *pea = [[TRPea alloc]initWithFrame:CGRectMake(100, 200, 60, 100)];
    [self.view addSubview:pea];
    TRIcePea *ipea = [[TRIcePea alloc]initWithFrame:CGRectMake(200, 100, 60, 100)];
    [self.view addSubview:ipea];
    TRNut *n = [[TRNut alloc]initWithFrame:CGRectMake(200, 200, 60, 100)];
    [self.view addSubview:n];
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
