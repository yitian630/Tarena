//
//  TRViewController.m
//  Day11FileHandleWrite
//
//  Created by tarena on 14-4-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
- (IBAction)firstAction:(id)sender;
- (IBAction)secondAction:(id)sender;

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

//    NSFileHandle *readFH = [NSFileHandle fileHandleForReadingAtPath:@"/Users/tarena/Downloads/Day15PhotoRiver/Day15PhotoRiver/美女/6.jpg"];
//    long long length = [readFH seekToEndOfFile];
//    [readFH seekToFileOffset:(int)length/2];
//    
//    NSData *subData = [readFH readDataToEndOfFile];
//
//    NSFileHandle *writeFH = [NSFileHandle fileHandleForWritingAtPath:@"/Users/tarena/Documents/a.jpg"];
//    [writeFH seekToFileOffset:length/2];
//    [writeFH writeData:subData];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)firstAction:(id)sender {
    NSFileHandle *readFH = [NSFileHandle fileHandleForReadingAtPath:@"/Users/tarena/Downloads/Day15PhotoRiver/Day15PhotoRiver/美女/6.jpg"];
    long long length = [readFH seekToEndOfFile];
    
    [readFH seekToFileOffset:0];
//读取图片的前一半
    NSData *subData = [readFH readDataOfLength:(int)length/2];
//使用fileHandle写数据的时候一定要保证该文件已经存在了 如果不存在创建一个空文件
    [[NSFileManager defaultManager]createFileAtPath:@"/Users/tarena/Documents/myGirl.jpg" contents:Nil attributes:Nil];
    
    
    NSFileHandle *writeFH = [NSFileHandle fileHandleForWritingAtPath:@"/Users/tarena/Documents/myGirl.jpg"];
    
    [writeFH writeData:subData];
    
    
}

- (IBAction)secondAction:(id)sender {
    NSFileHandle *readFH = [NSFileHandle fileHandleForReadingAtPath:@"/Users/tarena/Downloads/Day15PhotoRiver/Day15PhotoRiver/美女/6.jpg"];
    long long length = [readFH seekToEndOfFile];
    
    [readFH seekToFileOffset:length/2];
    
    NSData *subData = [readFH readDataToEndOfFile];
    
    NSFileHandle *writeFH = [NSFileHandle fileHandleForWritingAtPath:@"/Users/tarena/Documents/myGirl.jpg"];
    //需要先把写的游标设置到一半的位置
    [writeFH seekToFileOffset:length/2];
    [writeFH writeData:subData];
    
    
}
@end
