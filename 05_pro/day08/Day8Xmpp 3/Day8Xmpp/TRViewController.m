//
//  TRViewController.m
//  Day8Xmpp
//
//  Created by tarena on 14-5-27.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRXMPPManager.h"
@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [TRXMPPManager shareManager];
    
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(sendAction) userInfo:Nil repeats:YES];
}

-(void)sendAction{
    [[TRXMPPManager shareManager]sendMessage:@"第一个页面说的话" toName:@"1402liugb"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
