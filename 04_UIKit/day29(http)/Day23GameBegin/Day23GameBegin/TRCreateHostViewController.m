//
//  TRCreateHostViewController.m
//  Day23GameBegin
//
//  Created by tarena on 14-5-13.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRCreateHostViewController.h"

@interface TRCreateHostViewController ()
@property (nonatomic, strong)AsyncUdpSocket *myUDPSocket;
@property (nonatomic, copy)NSString *host;
@end

@implementation TRCreateHostViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myUDPSocket = [[AsyncUdpSocket alloc]initWithDelegate:self];
    [self.myUDPSocket bindToPort:9000 error:Nil];
    [self.myUDPSocket enableBroadcast:YES error:Nil];
    [self.myUDPSocket receiveWithTimeout:-1 tag:0];
}

-(BOOL)onUdpSocket:(AsyncUdpSocket *)sock didReceiveData:(NSData *)data withTag:(long)tag fromHost:(NSString *)host port:(UInt16)port{
    [self.myUDPSocket receiveWithTimeout:-1 tag:0];
    NSString *receiveInfo = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    self.host = host;
    if ([receiveInfo isEqualToString:@"谁在线"]) {
        NSString *info = @"我在线";
        [self.myUDPSocket sendData:[info dataUsingEncoding:NSUTF8StringEncoding] toHost:host port:9000 withTimeout:-1 tag:0];
        
    }else if ([receiveInfo isEqualToString:@"请求开始"]){
        UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"提示" message:[NSString stringWithFormat:@"%@请求开始游戏",host] delegate:self cancelButtonTitle:@"拒绝" otherButtonTitles:@"同意", nil];
        [av show];
    }

    return YES;
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *info = @"不同意";
    if (buttonIndex == 1) {
        info = @"同意";
        [self performSegueWithIdentifier:@"beginGame" sender:Nil];
    }
    [self.myUDPSocket sendData:[info dataUsingEncoding:NSUTF8StringEncoding] toHost:self.host port:9000 withTimeout:-1 tag:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
