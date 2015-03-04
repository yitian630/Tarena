//
//  TRFirstViewController.m
//  Demo2_NavigationController
//
//  Created by tarena on 14-4-4.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRFirstViewController.h"
#import "TRSecondViewController.h"
#import "TRAddContactViewController.h"

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
    //标题Title
    self.title = @"FirstVC";
    //导航栏 navigationItem
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addContact:)];
    self.navigationItem.leftBarButtonItem = item;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"群组" style:UIBarButtonItemStyleDone target:self action:@selector(next)];
    
    //工具栏  ToolBar
    UIBarButtonItem *tb1 = [[UIBarButtonItem alloc]initWithTitle:@"TB1" style:UIBarButtonItemStylePlain target:nil action:nil];
    UIBarButtonItem *tb2 = [[UIBarButtonItem alloc]initWithTitle:@"TB2" style:UIBarButtonItemStylePlain target:nil action:nil];
    UIBarButtonItem *tb3 = [[UIBarButtonItem alloc]initWithTitle:@"TB3" style:UIBarButtonItemStylePlain target:nil action:nil];
    //木棍
    UIBarButtonItem *fixed = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixed.width = 20;
    //弹簧
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    self.toolbarItems = @[fixed, tb1, flexible, tb2, flexible, tb3, fixed];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.toolbarHidden = NO;
}

- (IBAction)next
{
    TRSecondViewController *secondVC = [[TRSecondViewController alloc]initWithNibName:@"TRSecondViewController" bundle:nil];
    //进行正向传参
    //secondVC.parameter = ...;
    
    [self.navigationController pushViewController:secondVC animated:YES];
}

- (void)addContact:(id)sender
{
    NSLog(@"sender:%@", sender);
    TRAddContactViewController *addContactVC = [[TRAddContactViewController alloc]initWithNibName:@"TRAddContactViewController" bundle:nil];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:addContactVC];
    
    //NavigationController 不能再push一个NavigationController
    //[self.navigationController pushViewController:navi animated:YES];//ERROR
    //但是可以让当前VC展示(present)一个NavigationController
    [self presentViewController:navi animated:YES completion:nil];
    
}

@end
