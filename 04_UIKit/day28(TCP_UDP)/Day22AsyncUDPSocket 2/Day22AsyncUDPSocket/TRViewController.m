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
@property (nonatomic, strong)NSMutableArray *ips;
@property (nonatomic, copy)NSString *toHost;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.ips = [NSMutableArray array];
    
    self.myUDPSocket = [[AsyncUdpSocket alloc]initWithDelegate:self];
    
    //设置端口
    [self.myUDPSocket bindToPort:9000 error:Nil];
    
    //设置为广播
    [self.myUDPSocket enableBroadcast:YES error:Nil];
    //开始接收数据
    [self.myUDPSocket receiveWithTimeout:-1 tag:0];
    
    
    //检测谁在线
    [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(checkWhoOnline) userInfo:Nil repeats:YES];
    [self checkWhoOnline];
    
}

-(void)checkWhoOnline{
    
    
    [self.myUDPSocket sendData:[@"谁在线" dataUsingEncoding:NSUTF8StringEncoding] toHost:@"255.255.255.255" port:9000 withTimeout:-1 tag:0];
}

//当读取到数据的时候会调用
-(BOOL)onUdpSocket:(AsyncUdpSocket *)sock didReceiveData:(NSData *)data withTag:(long)tag fromHost:(NSString *)host port:(UInt16)port{
    
    //保证后面的数据能够持续接收
    [self.myUDPSocket receiveWithTimeout:-1 tag:0];
    if ([host hasPrefix:@":"]) {
        return YES;
    }
    
    NSString *receiveInfo = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    if ([receiveInfo isEqualToString:@"我在线"]) {
        //判断数组中是否包含host
        if (![self.ips containsObject:host]) {
             [self.ips addObject:host];
            //数据源发生改变要刷新tableview
            [self.ipsTableView reloadData];
        }
       //如果接收到别人检测的消息 那就给他回复我在线
    }else if ([receiveInfo isEqualToString:@"谁在线"]){
        
        [self.myUDPSocket sendData:[@"我在线" dataUsingEncoding:NSUTF8StringEncoding] toHost:host port:9000 withTimeout:-1 tag:0];
        
    }else{//接收到用户发的正常消息
        self.myTV.text = [self.myTV.text stringByAppendingFormat:@"\n%@说：%@",host,receiveInfo];
    }
    
 
    
    return YES;
}
- (IBAction)clicked:(id)sender {
    NSString *info = self.sendInfoTF.text;
    
    NSData *data = [info dataUsingEncoding:NSUTF8StringEncoding];
 
    if (self.mySwitch.isOn) {//如果是对所有人说
         [self.myUDPSocket sendData:data toHost:@"255.255.255.255" port:9000 withTimeout:-1 tag:0];
        
        
              self.myTV.text = [self.myTV.text stringByAppendingFormat:@"\n对所有人说：%@",info];
    }else{//对某一个人说
        
         [self.myUDPSocket sendData:data toHost:self.toHost port:9000 withTimeout:-1 tag:0];
         self.myTV.text = [self.myTV.text stringByAppendingFormat:@"\n对%@说：%@",self.toHost,info];
    }

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tableviewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.ips.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSString *host = self.ips[indexPath.row];
    cell.textLabel.text = [[host componentsSeparatedByString:@"."] lastObject];
    
    return cell;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.toHost = self.ips[indexPath.row];
    self.myLabel.text = [NSString stringWithFormat:@"对%@说：",self.toHost];
    [self.mySwitch setOn:NO];
   
    
}

- (IBAction)mySwichChangeAction:(id)sender {
    if (self.mySwitch.isOn) {
        self.myLabel.text = @"对所有人说：";
    }else{
        self.myLabel.text = [NSString stringWithFormat:@"对%@说：",self.toHost];
    }
}
@end
