//
//  TRViewController.m
//  Day9CountDown
//
//  Created by tarena on 14-4-21.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *myDP;

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.myDP.countDownDuration = 3600*5;
     [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDownAction) userInfo:nil repeats:YES];
}
-(void)countDownAction{
    self.myDP.countDownDuration-=60;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
