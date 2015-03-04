//
//  TRViewController.m
//  Day4StorybordJumpPage
//
//  Created by tarena on 14-4-14.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRSecondViewController.h"
@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(jumpPage) userInfo:nil repeats:NO];
}
-(void)jumpPage{
    
    NSString *identifier = [NSString stringWithFormat:@"jump%d",arc4random()%3+1];
    //通过代码执行segue跳转
    [self performSegueWithIdentifier:identifier sender:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"jump1"]) {
        TRSecondViewController *vc = segue.destinationViewController;
        vc.str = @"abc";
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
