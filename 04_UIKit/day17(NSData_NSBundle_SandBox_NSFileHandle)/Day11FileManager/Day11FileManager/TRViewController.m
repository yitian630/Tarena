//
//  TRViewController.m
//  Day11FileManager
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
	
    NSFileManager *fm = [NSFileManager defaultManager];
//    //删除文件
//    [fm removeItemAtPath:@"/Users/tarena/Desktop/imgs/9.jpg" error:Nil];
//    //复制文件
//    [fm copyItemAtPath:@"/Users/tarena/Desktop/imgs/0.jpg" toPath:@"/Users/tarena/Desktop/imgs/newImages/0.jpg" error:Nil];
//    //移动文件
//    [fm moveItemAtPath:@"/Users/tarena/Desktop/imgs/1.jpg" toPath:@"/Users/tarena/Desktop/imgs/newImages/1.jpg" error:Nil];
//    NSData *data = [@"哈喽！！！" dataUsingEncoding:NSUTF8StringEncoding];
//    //创建文件
//    [fm createFileAtPath:@"/Users/tarena/Desktop/imgs/newImages/a.txt" contents:data attributes:Nil];
    //创建文件夹 IntermediateDirectories参数如果是yes能够自动创建出中间文件夹 NO则不会创建中间文件夹
//    [fm createDirectoryAtPath:@"/Users/tarena/Desktop/imgs/newImages/abd" withIntermediateDirectories:NO attributes:Nil error:Nil];
    
    //判断某个路径的文件是否存在
//    if ([fm fileExistsAtPath:@"/Users/tarena/Desktop/imgs/newImages/2.jpg"]) {
//        NSLog(@"文件存在");
//    }else NSLog(@"不存在");
//判断是否是文件夹
    BOOL isDrectory = NO;
    if ([fm fileExistsAtPath:@"/Users/tarena/Desktop/imgs/newImages/0.jpg" isDirectory:&isDrectory]&&isDrectory) {
        NSLog(@"是文件夹");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
