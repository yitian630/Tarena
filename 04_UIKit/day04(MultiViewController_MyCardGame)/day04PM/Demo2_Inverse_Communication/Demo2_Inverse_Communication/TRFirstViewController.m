//
//  TRFirstViewController.m
//  Demo2_Inverse_Communication
//
//  Created by tarena on 14-4-2.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRFirstViewController.h"
#import "TRSecondViewController.h"

@interface TRFirstViewController ()
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

@end

@implementation TRFirstViewController



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.displayLabel.text = self.content;
}
- (void)setContent:(NSString *)content
{
    _content = content;
    self.displayLabel.text = self.content;
}
- (IBAction)goSecondVC
{
    TRSecondViewController *secondVC = [[TRSecondViewController alloc]initWithNibName:@"TRSecondViewController" bundle:nil];
    secondVC.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    secondVC.firstVC = self;
    [self presentViewController:secondVC animated:YES completion:nil];
}

@end
