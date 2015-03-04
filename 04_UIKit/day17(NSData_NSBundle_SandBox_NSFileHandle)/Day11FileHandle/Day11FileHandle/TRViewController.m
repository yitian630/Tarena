//
//  TRViewController.m
//  Day11FileHandle
//
//  Created by tarena on 14-4-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//	010101010100110011010101000101010010101010101010101010
    NSFileHandle *fileReadHandle = [NSFileHandle fileHandleForReadingAtPath:@"/Users/tarena/Downloads/Day15PhotoRiver/Day15PhotoRiver/美女/5.jpg"];
    
     //获取文件的总长度 还把游标设置到了最后面
     long long length = [fileReadHandle seekToEndOfFile];
    //把游标设置到起始位置
    [fileReadHandle seekToFileOffset:0];
    NSData *subData = [fileReadHandle readDataOfLength:(int)length/2];
    //********读取后一半数据
//    [fileReadHandle seekToFileOffset:length/2];
//    NSData *subData = [fileReadHandle readDataToEndOfFile];
//*********************
    UIImage *image = [UIImage imageWithData:subData];
    
    UIImageView *iv = [[UIImageView alloc]initWithFrame:self.view.bounds];
    iv.image = image;
    [self.view addSubview:iv];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
