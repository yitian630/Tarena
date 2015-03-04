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
    //NSString 和NSData之间互转
    NSString *info = @"你好吗？";//010101101001010101010101001010
    NSData *infoData = [info dataUsingEncoding:NSUTF8StringEncoding];
    //把data转回nsstring
    NSString *newInfo = [[NSString alloc]initWithData:infoData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",newInfo);
    
	NSData *imageData = [NSData dataWithContentsOfFile:@"/Users/tarena/Desktop/美女/美女/0.jpg"];
    
    UIImage *image = [UIImage imageWithData:imageData];
    
    UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    iv.image = image;
    [self.view addSubview:iv];
    
    
    NSLog(@"文件长度：%d",imageData.length);
    
    //把data写到某个位置
    NSString *documentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    [imageData writeToFile:[documentsPath stringByAppendingPathComponent:@"a.jpg"] atomically:YES];
    
    NSLog(@"%@",documentsPath);
}



@end
