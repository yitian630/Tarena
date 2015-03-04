//
//  TRMyViewController.m
//  Demo2_IBOutlet_IBAction
//
//  Created by tarena on 14-3-31.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRMyViewController.h"

@interface TRMyViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@end

@implementation TRMyViewController

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
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)tap
{
    NSLog(@"...");
    self.myLabel.text = @"被修改之后";
}

@end
