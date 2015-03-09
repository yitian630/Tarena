//
//  TRMainNavigationController.m
//  TLBS
//
//  Created by tarena on 14-3-28.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRMainNavigationController.h"

@interface TRMainNavigationController ()

@end

@implementation TRMainNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
        self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
	  [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_bg.png"] forBarMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
