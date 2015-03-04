//
//  TRSecondViewController.m
//  Demo1_MultiViewController
//
//  Created by tarena on 14-4-2.
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

//视图显示之前自动调用
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.displayLabel.text = self.content;
}


- (IBAction)backToFirstVC
{
    //self.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc
{
    NSLog(@"SecondViewController dealloc");
}
@end
