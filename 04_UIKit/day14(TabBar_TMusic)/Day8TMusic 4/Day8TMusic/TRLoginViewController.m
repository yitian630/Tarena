//
//  TRLoginViewController.m
//  Day8TMusic
//
//  Created by tarena on 14-4-18.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRLoginViewController.h"

@interface TRLoginViewController ()

@end

@implementation TRLoginViewController
- (IBAction)loginAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:Nil];
}
- (IBAction)dismissAction:(id)sender {
     [self dismissViewControllerAnimated:YES completion:Nil];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
 
@end
