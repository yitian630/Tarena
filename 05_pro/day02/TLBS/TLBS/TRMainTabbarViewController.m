//
//  TRMainTabbarViewController.m
//  TLBS
//
//  Created by tarena on 14-3-28.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRMainTabbarViewController.h"

@interface TRMainTabbarViewController ()

@end

@implementation TRMainTabbarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"top_bg.png"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
