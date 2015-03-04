//
//  TRViewController.m
//  Day22Chat
//
//  Created by tarena on 14-5-10.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UITextField *sendInfoTF;
@property (nonatomic, strong)AsyncSocket *serverSocket;
@property (nonatomic, strong)AsyncSocket *myNewSocket;
@property (nonatomic, strong)AsyncSocket *clientSocket;
@property (nonatomic, copy)NSString *fileName;
@property (nonatomic)int fileLength;
@property (nonatomic, strong)NSMutableData *receiveAllData;
@property (weak, nonatomic) IBOutlet UITextField *hostTF;
@property (nonatomic, copy)NSString *host;
@end

@implementation TRViewController
- (IBAction)sendAction:(id)sender {
    self.clientSocket =[[AsyncSocket alloc]initWithDelegate:self];
    
    [self.clientSocket connectToHost:self.hostTF.text onPort:8000 error:Nil];
    NSString *sendInfo = self.sendInfoTF.text;
    NSMutableData *sendAllData = Nil;
    NSString *showInTVInfo = Nil;
    if ([sendInfo hasPrefix:@"/"]) {//判断是文件   messageType&&filename&&fileLength
        NSString *fileName = [sendInfo lastPathComponent];
        NSData *fileData = [NSData dataWithContentsOfFile:sendInfo];
        NSString *headerString = [NSString stringWithFormat:@"file&&%@&&%d",fileName,fileData.length];
        
        sendAllData = [self getAllDataByHeaderString:headerString];
        [sendAllData appendData:fileData];
        
        showInTVInfo = [NSString stringWithFormat:@"我发送了一个文件%@",fileName];
    }else{//判断是文本
        
        NSString *headerString = [NSString stringWithFormat:@"text&& &&"];
        sendAllData = [self getAllDataByHeaderString:headerString];
        //把要发送的文本转成data
        NSData *sendInfoData = [sendInfo dataUsingEncoding:NSUTF8StringEncoding];
        [sendAllData appendData:sendInfoData];
          showInTVInfo = [NSString stringWithFormat:@"我说：%@",sendInfo];
    }
    //把发送的信息显示在tv中
    self.myTV.text = [self.myTV.text stringByAppendingFormat:@"\n%@",showInTVInfo];
    
       [self.clientSocket writeData:sendAllData withTimeout:-1 tag:0];
    
    
    
}

-(NSMutableData *)getAllDataByHeaderString:(NSString *)string{
    NSMutableData *sendAllData = [NSMutableData dataWithLength:100];
    
    NSData *headerData = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    [sendAllData replaceBytesInRange:NSMakeRange(0, headerData.length) withBytes:headerData.bytes];
    
    return sendAllData;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //创建server
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
    
    //    1.获取前100个字节
    NSData *headerData = [data subdataWithRange:NSMakeRange(0, 100)];
 
    
    NSString *headerString = [[NSString alloc]initWithData:headerData encoding:NSUTF8StringEncoding];
    //判断是否包含消息头
    if (headerString&&[headerString componentsSeparatedByString:@"&&"].count==3) {
        NSArray *headers = [headerString componentsSeparatedByString:@"&&"];
        //判断消息类型
        
        NSString *messageType = headers[0];
        if ([messageType isEqualToString:@"file"]) {//判断出接收到的是文件
            self.receiveAllData = [NSMutableData data];
            self.fileName = headers[1];
            self.fileLength = [headers[2]intValue];
            //得到抛去头 剩下的文件数据
            NSData *subFileData = [data subdataWithRange:NSMakeRange(100, data.length-100)];
            [self.receiveAllData appendData:subFileData];

        }else{//接收到的是文本
            
            NSData *textData = [data subdataWithRange:NSMakeRange(100, data.length-100)];
            NSString *text = [[NSString alloc]initWithData:textData encoding:NSUTF8StringEncoding];
            
          //把接收到的消息显示在tv中
            self.myTV.text = [self.myTV.text stringByAppendingFormat:@"\n%@说:%@",self.host,text];
        }
    }else{//如果接收到的部分数据中没有头 把数据直接加到allFileData中
        [self.receiveAllData appendData:data];
    }
    //判断数据有没有接收完成
    if (self.receiveAllData.length == self.fileLength&&self.fileLength!=0) {
        NSString *filePath = [@"/Users/tarena/Desktop" stringByAppendingPathComponent:self.fileName];
        //把接收到的数据保存
        [self.receiveAllData writeToFile:filePath atomically:YES];
        self.fileLength = 0;
        //把接收到文件显示在tv中
           self.myTV.text = [self.myTV.text stringByAppendingFormat:@"\n接收到%@发送的%@",self.host,self.fileName];
    }
    //继续读取后面的数据部分
    [self.myNewSocket readDataWithTimeout:-1 tag:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
