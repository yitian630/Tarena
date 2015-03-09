//
//  TRSecondViewController.m
//  Day8Xmpp
//
//  Created by tarena on 14-5-27.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRSecondViewController.h"
#import "TRXMPPManager.h"
@interface TRSecondViewController ()
@property (weak, nonatomic) IBOutlet UITextView *myTV;

@end

@implementation TRSecondViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    [TRXMPPManager shareManager].delegate = self;
}

-(void)didReceiveMessage:(XMPPMessage *)message{
    
    NSLog(@"第二个页面接收到：%@",[message body]);
    self.myTV.text = [self.myTV.text stringByAppendingFormat:@"\n%@",[message body]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
