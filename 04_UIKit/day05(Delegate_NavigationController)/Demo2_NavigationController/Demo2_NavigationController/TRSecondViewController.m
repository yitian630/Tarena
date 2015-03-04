//
//  TRSecondViewController.m
//  Demo2_NavigationController
//
//  Created by tarena on 14-4-4.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRSecondViewController.h"

@interface TRSecondViewController ()

@end

@implementation TRSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.toolbarHidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"SecondVC";
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithTitle:@"b1" style:UIBarButtonItemStyleDone target:nil action:nil];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithTitle:@"b2" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.rightBarButtonItems = @[item2, item1];
    //self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"<<返回" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
}
- (IBAction)back
{
    [self.navigationController popViewControllerAnimated:YES];
    //[self.navigationController popToRootViewControllerAnimated:YES];

}

@end
