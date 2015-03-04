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

- (void)viewDidLoad
{
   [super viewDidLoad];
   //1.创建socket
   self.clientSocket = [[AsyncSocket alloc]initWithDelegate:self];
   //建立链接
   [self.clientSocket connectToHost:@"192.168.1.159" onPort:8000 error:nil];
}

- (IBAction)clicked:(id)sender {
    NSString *info = @"你好啊！！！";
    [self.clientSocket writeData:[info dataUsingEncoding:NSUTF8StringEncoding] withTimeout:-1 tag:0];
#pragma mark - 等待服务器的返回数据
    //发送完数据之后就可以调用读取数据的方法 等待服务器的返回数据
    [self.clientSocket readDataWithTimeout:-1 tag:0];
}

#pragma mark - 客户端读数据的方法
-(void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    NSString *info = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"接收到服务器返回的数据：%@",info);
     [self.clientSocket readDataWithTimeout:-1 tag:0];
}

-(void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag{
    NSLog(@"发送完成");
}



@end
