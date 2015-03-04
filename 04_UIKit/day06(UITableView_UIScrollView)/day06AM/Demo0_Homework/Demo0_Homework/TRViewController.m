//
//  TRViewController.m
//  Demo0_Homework
//
//  Created by tarena on 14-4-8.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

@end

@implementation TRViewController

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
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.displayLabel.font = [UIFont systemFontOfSize:self.size];
}


- (IBAction)next:(id)sender
{
//    self.size -= 5;
//    self.displayLabel.font = [UIFont systemFontOfSize:self.size];
    TRViewController *nextVC = [[TRViewController alloc]initWithNibName:@"TRViewController" bundle:nil];
    nextVC.size = self.size - 5;
    [self.navigationController pushViewController:nextVC animated:YES];
}


@end
