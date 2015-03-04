//
//  TRFirstViewController.m
//  Demo2_NavigationController
//
//  Created by tarena on 14-4-4.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRFirstViewController.h"
#import "TRSecondViewController.h"

@interface TRFirstViewController ()

@end

@implementation TRFirstViewController

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
    self.title = @"FirstVC";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)next
{
    TRSecondViewController *secondVC = [[TRSecondViewController alloc]initWithNibName:@"TRSecondViewController" bundle:nil];
    [self.navigationController pushViewController:secondVC animated:YES];
}
@end
