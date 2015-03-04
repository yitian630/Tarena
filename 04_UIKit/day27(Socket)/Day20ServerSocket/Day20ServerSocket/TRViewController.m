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
@property (nonatomic, strong)NSMutableData *allFileData;
@property (nonatomic, copy) NSString *fileName;
@property (nonatomic)int fileLength;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.allFileData = [NSMutableData data];
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
//    1.获取前100个字节
    NSData *headerData = [data subdataWithRange:NSMakeRange(0, 100)];
//    @"abc"  ---->utf8--->0101110100110
//    abc.mp3&&234234
//    10010010101 ->utf8---->abc
//    111011010011001 ---->utf8--->@#$%$%$#@$@$%@$
    
    NSString *headerString = [[NSString alloc]initWithData:headerData encoding:NSUTF8StringEncoding];
    //判断是否包含消息头
    if (headerString&&[headerString componentsSeparatedByString:@"&&"].count==2) {
//        如果包含头 那就需要把头里面的数据取出来
        NSArray *headers = [headerString componentsSeparatedByString:@"&&"];
        self.fileName = headers[0];
        self.fileLength = [headers[1]intValue];
        //得到抛去头 剩下的文件数据
        NSData *subFileData = [data subdataWithRange:NSMakeRange(100, data.length-100)];
        [self.allFileData appendData:subFileData];
        
    }else{//如果接收到的部分数据中没有头 把数据直接加到allFileData中
        [self.allFileData appendData:data];
    }
    //判断数据有没有接收完成
    if (self.allFileData.length == self.fileLength) {
        NSString *filePath = [@"/Users/tarena/Desktop" stringByAppendingPathComponent:self.fileName];
        //把接收到的数据保存
        [self.allFileData writeToFile:filePath atomically:YES];
    }
    //继续读取后面的数据部分
      [self.myNewSocket readDataWithTimeout:-1 tag:0];
}
////当断开连接的时候
//-(void)onSocketDidDisconnect:(AsyncSocket *)sock{
//    
//}


//如果传输数据出问题 首先检查发送端的消息头是否正确  把发送端的发送的完整数据长度输出 看是否和接收到的数据长度一致



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clicked:(id)sender {
    
    self.clientSocket = [[AsyncSocket alloc]initWithDelegate:self];
    [self.clientSocket connectToHost:@"127.0.0.1" onPort:8000 error:nil];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"a" ofType:@"jpg"];
//    1.创建消息头字符串
    NSData *fileData = [NSData dataWithContentsOfFile:path];
    NSString *headerString = [NSString stringWithFormat:@"%@&&%d",[path lastPathComponent],fileData.length];
 
   
//    2.把消息头字符串装进100个字节的data里面
    NSMutableData *sendAllData = [NSMutableData dataWithLength:100];
     NSData *headerData = [headerString dataUsingEncoding:NSUTF8StringEncoding];
    //把haderData替换进去
    [sendAllData replaceBytesInRange:NSMakeRange(0, headerData.length) withBytes:headerData.bytes];
//    3.把消息头data和fileData拼接到一起
    [sendAllData appendData:fileData];
//    4.把包含了头和文件的Data发送出去
    [self.clientSocket writeData:sendAllData withTimeout:-1 tag:0];
    
    
    
    
    
    
    
    //    发数据之前要拼接消息头 头里面包含名称和长度     @"abc.mp&&31231231" 100
//  101010100101010100000000000001010101001110101010010101010101100101010110010101010010100101010011001010100101010010101010010101001010010101010101001010101010101001010
   
    
}

@end
