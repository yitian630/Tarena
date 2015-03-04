//
//  TRViewController.m
//  Day22AsyncUDPSocket
//
//  Created by tarena on 14-5-12.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (nonatomic, strong)AsyncUdpSocket *myUDPSocket;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.myUDPSocket = [[AsyncUdpSocket alloc]initWithDelegate:self];
    
    //设置端口
    [self.myUDPSocket bindToPort:9000 error:Nil];
    
    //设置为广播
    [self.myUDPSocket enableBroadcast:YES error:Nil];
    
    //开始接收数据
    [self.myUDPSocket receiveWithTimeout:-1 tag:0];
}
//当读取到数据的时候会调用
-(BOOL)onUdpSocket:(AsyncUdpSocket *)sock didReceiveData:(NSData *)data withTag:(long)tag fromHost:(NSString *)host port:(UInt16)port{
    
    //保证后面的数据能够持续接收
    [self.myUDPSocket receiveWithTimeout:-1 tag:0];
   
    if ([host hasPrefix:@":"]) {
        return YES;
    }
    
    NSString *receiveInfo = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"接收到%@说：%@",host,receiveInfo);
    
 
    
    return YES;
}
- (IBAction)clicked:(id)sender {
    NSString *info = @"同志们好！！！！";
    
    NSData *data = [info dataUsingEncoding:NSUTF8StringEncoding];
    
    [self.myUDPSocket sendData:data toHost:@"255.255.255.255" port:9000 withTimeout:-1 tag:0];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
