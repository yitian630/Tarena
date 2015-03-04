//
//  TRDownloadViewController.m
//  Day22ServerFile
//
//  Created by tarena on 14-5-12.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRDownloadViewController.h"
#import "TRUtils.h"
@interface TRDownloadViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *myPV;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (nonatomic, strong)AsyncSocket *clientSocket;
@property (nonatomic, strong)NSMutableData *receiveFileData;
@end

@implementation TRDownloadViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.receiveFileData = [NSMutableData data];
    
	self.clientSocket = [[AsyncSocket alloc]initWithDelegate:self];
    
    [self.clientSocket connectToHost:@"127.0.0.1" onPort:8000 error:Nil];
    
    NSString *headerString = [NSString stringWithFormat:@"download&&%@&&",self.downloadFile.path];
    
    NSMutableData *data = [TRUtils getAllDataByHeaderString:headerString];
    
    [self.clientSocket writeData:data withTimeout:-1 tag:0];
    
    [self.clientSocket readDataWithTimeout:-1 tag:0];
    self.myLabel.text = [NSString stringWithFormat:@"正在下载%@",self.downloadFile.name];
}

-(void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
    
    //更新进度条
    self.myPV.progress = self.receiveFileData.length*1.0/self.downloadFile.length;
    //把接收到的数据追加到一起
    [self.receiveFileData appendData:data];
    //判断是否下载完成
    if (self.receiveFileData.length == self.downloadFile.length) {
        NSString *newPath = [@"/Users/tarena/Desktop/接收文件" stringByAppendingPathComponent:self.downloadFile.name];
        [self.receiveFileData writeToFile:newPath atomically:YES];
    }
    
    [self.clientSocket readDataWithTimeout:-1 tag:0];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
