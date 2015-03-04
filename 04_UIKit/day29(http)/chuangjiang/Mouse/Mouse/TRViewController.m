//
//  TRViewController.m
//  Mouse
//
//  Created by tarena on 14-3-29.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (nonatomic,strong) NSTimer *timer;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(addMouse) userInfo:nil repeats:YES];
}
-(void)addMouse {
    UIButton *mouse = [[UIButton alloc]initWithFrame:CGRectMake(arc4random()%290, 20+arc4random()%518, 30, 30)];
    [mouse setBackgroundColor:[UIColor redColor]];
    [mouse addTarget:self action:@selector(deleteMouse:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mouse];
}
-(void)deleteMouse:(UIButton*)mouse{
    [mouse removeFromSuperview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
