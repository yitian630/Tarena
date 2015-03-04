//
//  TRViewController.m
//  Day20Client
//
//  Created by tarena on 14-5-8.
//  Copyright (c) 2014年 tarena. All rights reserved.
//
#import "AsyncSocket.h"
#import "TRViewController.h"

@interface TRViewController ()
@property (nonatomic, strong)AsyncSocket *clientSocket;
@end

@implementation TRViewController
- (IBAction)clicked:(id)sender {
    //1.创建socket
    self.clientSocket = [[AsyncSocket alloc]initWithDelegate:self];
    //建立链接
    [self.clientSocket connectToHost:@"对方的ip地址" onPort:8000 error:nil];
    NSString *info = @"你好啊！！！";
    [self.clientSocket writeData:[info dataUsingEncoding:NSUTF8StringEncoding] withTimeout:-1 tag:0];
}
-(void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag{
    NSLog(@"发送完成");
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
