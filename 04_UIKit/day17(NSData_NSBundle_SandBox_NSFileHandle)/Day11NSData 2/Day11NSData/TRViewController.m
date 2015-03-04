//
//  TRViewController.m
//  Day11NSData
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
    //得到*.app下面imgs文件夹的完整路径
    NSString *imgsPath = [[[NSBundle mainBundle]resourcePath] stringByAppendingPathComponent:@"imgs"];
    NSFileManager *fm = [NSFileManager defaultManager];
    //取到imgs文件夹下面的所有文件
    NSArray *fileNames = [fm contentsOfDirectoryAtPath:imgsPath error:Nil];
    //得到documents路径
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    for (NSString *fileName in fileNames) {
        NSString *filePath = [imgsPath stringByAppendingPathComponent:fileName];
        //把图片加载到内存
        NSData *imageData = [NSData dataWithContentsOfFile:filePath];
        //从内存 保存到documents路径下面
        [imageData writeToFile:[documentPath stringByAppendingPathComponent:fileName] atomically:YES];
        
        
    }
    
    NSLog(@"%@",NSHomeDirectory());
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
