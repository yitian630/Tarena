//
//  TRRootViewController.m
//  Demo1_Delegate
//
//  Created by tarena on 14-4-4.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRRootViewController.h"
#import "TRAViewController.h"
#import "TRBViewController.h"
#import "TRCViewController.h"
@interface TRRootViewController ()

@end

@implementation TRRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)goToAVC
{
    TRAViewController *avc = [[TRAViewController alloc]initWithNibName:@"TRAViewController" bundle:nil];
    [self presentViewController:avc animated:YES completion:nil];
}
- (IBAction)gotoBVC
{
    TRBViewController *bvc = [[TRBViewController alloc]initWithNibName:@"TRBViewController" bundle:nil];
    [self presentViewController:bvc animated:YES completion:nil];
}
- (IBAction)gotoCVC
{
    TRCViewController *cvc = [[TRCViewController alloc]initWithNibName:@"TRCViewController" bundle:nil];
    [self presentViewController:cvc animated:YES completion:nil];
}




@end
