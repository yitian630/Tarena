//
//  TRMyViewController.m
//  Demo1_xib
//
//  Created by tarena on 14-3-31.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRMyViewController.h"

@interface TRMyViewController ()
@property (nonatomic, weak) IBOutlet UIButton *button;
@property (nonatomic, weak) IBOutlet UILabel *label;
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
    
    [self.button addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
}

- (void)tap
{
    NSLog(@"....");
    self.label.text = @"这是修改后的内容";
}
@end
