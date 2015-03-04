//
//  TRViewController.m
//  Day22ServerFile
//
//  Created by tarena on 14-5-12.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *myPV;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (nonatomic, strong)AsyncSocket *serverSocket;
@property (nonatomic, strong)AsyncSocket *myNewSocket;
@property (nonatomic, copy)NSString *host;
@property (nonatomic, copy)NSString *receiveFileName;
@property (nonatomic)int receiveFileLength;
@property (nonatomic, strong)NSMutableData *receiveFileData;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //避免下载完成的判断有误
	self.receiveFileLength = -1;
    self.serverSocket = [[AsyncSocket alloc]initWithDelegate:self];
    [self.serverSocket acceptOnPort:8000 error:Nil];
}

-(void)onSocket:(AsyncSocket *)sock didAcceptNewSocket:(AsyncSocket *)newSocket{
    self.myNewSocket = newSocket;
}
-(void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port{
    self.host = host;
    [self.myNewSocket readDataWithTimeout:-1 tag:0];
}
-(void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    NSData *headerData = [data subdataWithRange:NSMakeRange(0, 100)];
    NSString *headerString = [[NSString alloc]initWithData:headerData encoding:NSUTF8StringEncoding];
    if (headerString && [headerString componentsSeparatedByString:@"&&"].count==3) {
        NSArray *headers = [headerString componentsSeparatedByString:@"&&"];
        NSString *type = headers[0];
        
        
        if ([type isEqualToString:@"upload"]) {//上传
          
            self.receiveFileData = [NSMutableData data];
            self.receiveFileName = headers[1];
            self.receiveFileLength = [headers[2]intValue];
            NSData *subFileData = [data subdataWithRange:NSMakeRange(100, data.length-100)];
            [self.receiveFileData appendData:subFileData];
            
            //把当前状态显示在Label里面
              self.statusLabel.text = [NSString stringWithFormat:@"正在接收%@上传的%@",self.host,self.receiveFileName];
            
        }else if ([type isEqualToString:@"getList"]){//获取下载文件列表
            
            
        }else{//下载
           
            
        }
        
        
        
    }else{//没有消息头 说明是文件的其它部分数据
        [self.receiveFileData appendData:data];
    }
    
    //判断文件是否下载完成
    if (self.receiveFileData.length == self.receiveFileLength) {
        NSString *newPath = [@"/Users/tarena/Desktop/receiveFiles" stringByAppendingPathComponent:self.receiveFileName];
        [self.receiveFileData writeToFile:newPath atomically:YES];
        self.receiveFileLength = -1;
        
        //把当前状态显示在Label里面
        self.statusLabel.text = [NSString stringWithFormat:@"%@接收完成！！",self.receiveFileName];
    }
    
    //继续读取数据
    [self.myNewSocket readDataWithTimeout:-1 tag:0];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
