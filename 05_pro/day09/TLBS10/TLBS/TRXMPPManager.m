//
//  TRXMPPManager.m
//  Day7Xmpp
//
//  Created by tarena on 14-4-4.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRXMPPManager.h"
static TRXMPPManager *manager;
@implementation TRXMPPManager

+(TRXMPPManager *)shareManager{
    
    if (!manager) {
        manager = [[TRXMPPManager alloc]init];
    }
    
    return manager;
}
- (id)init
{
    self = [super init];
    if (self) {
       
    }
    return self;
}
-(void)connectWithOpendid:(NSString *)openID andName:(NSString *)name{
    self.openID = openID;
    self.name = name;
    [self initXMPP];
}
-(void)initXMPP{
    self.xmppStream = [[XMPPStream alloc]init];
    [self.xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
    
    //设置主机地址
  [self.xmppStream setHostName:@"124.207.192.18"];
    //设置主机端口
    [self.xmppStream setHostPort:5222];
    //设置当前用户
    NSString *jid = [NSString stringWithFormat:@"%@@tareng3gxmpp.com",self.name];
    [self.xmppStream setMyJID:[XMPPJID jidWithString:jid]];
    //开始连接服务器
    [self.xmppStream connectWithTimeout:XMPPStreamTimeoutNone error:Nil];
}

-(void)xmppStreamDidConnect:(XMPPStream *)sender{
    NSLog(@"成功连接到服务器");
    
    //连接成功后 登陆  密码为openid
    [self.xmppStream authenticateWithPassword:self.openID error:Nil];
    
}
-(void)xmppStreamDidDisconnect:(XMPPStream *)sender withError:(NSError *)error{
    NSLog(@"服务器断开");
    //开始连接服务器
    [self.xmppStream connectWithTimeout:XMPPStreamTimeoutNone error:Nil];
    
    
}
-(void)xmppStreamDidAuthenticate:(XMPPStream *)sender{
    NSLog(@"登陆成功");
    //通知服务器 我在线
    XMPPPresence *presence = [XMPPPresence presence];
    [self.xmppStream sendElement:presence];
    
    

    
}
-(void)sendMessage:(XMPPMessage *)message{
    [self.xmppStream sendElement:message];
}
-(void)xmppStream:(XMPPStream *)sender didReceiveMessage:(XMPPMessage *)message{
    NSLog(@"接收到消息");
    [self.delegate didReceiveMessage:message];

}

- (void)xmppStream:(XMPPStream *)sender didNotAuthenticate:(NSXMLElement *)error{
    NSLog(@"登陆失败");
    //注册
    if (![self.xmppStream registerWithPassword:self.openID error:Nil]) {
        NSLog(@"用户名已经存在");
    }
}
-(void)xmppStreamDidRegister:(XMPPStream *)sender{
    NSLog(@"注册成功！");
    //登陆
    [self.xmppStream authenticateWithPassword:self.openID error:Nil];
}
- (void)xmppStream:(XMPPStream *)sender didNotRegister:(NSXMLElement *)error{
    NSLog(@"注册失败%@",error);
}


@end
