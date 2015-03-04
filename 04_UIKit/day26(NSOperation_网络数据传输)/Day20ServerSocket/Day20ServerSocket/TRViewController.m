//
//  TRViewController.m
//  Day20ServerSocket
//
//  Created by tarena on 14-5-8.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (nonatomic, strong)AsyncSocket *myNewSocket;
@property (nonatomic,strong)AsyncSocket *clientSocket;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //1.创建socket对象
    self.serverSocket = [[AsyncSocket alloc]initWithDelegate:self];
    //2.监听端口  一般设置1000以上 别用别的程序的端口
    [self.serverSocket acceptOnPort:8000 error:nil];
}
//当接收到新的连接的时候
-(void)onSocket:(AsyncSocket *)sock didAcceptNewSocket:(AsyncSocket *)newSocket{
    
    //把链接进来的socket+1 不被释放 如果释放了那链接就断开了
    self.myNewSocket = newSocket;
}
//当连接到某个ip地址的时候 host就是对方的ip地址
-(void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port{
    
    //此方法手动调用读取数据的方法
    [self.myNewSocket readDataWithTimeout:-1 tag:0];
}
//当读取到数据的时候 此方法不会自动调用 需要手动调
-(void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    
    NSString *info = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"接收到:%@",info);
    
}
////当断开连接的时候
//-(void)onSocketDidDisconnect:(AsyncSocket *)sock{
//    
//}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clicked:(id)sender {
    
    self.clientSocket = [[AsyncSocket alloc]initWithDelegate:self];
    [self.clientSocket connectToHost:@"127.0.0.1" onPort:8000 error:nil];
    
    NSString *info = @"你好";
    NSData *data = [info dataUsingEncoding:NSUTF8StringEncoding];
    
    [self.clientSocket writeData:data withTimeout:-1 tag:0];
    
    
    
}

@end
