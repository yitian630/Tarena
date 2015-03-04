//
//  TRViewController.m
//  Day13Archiver
//
//  Created by tarena on 14-4-26.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
//    NSArray *names = @[@"老杨",@"老郭",@"我",@"老张"];
//    
//    //实现归档 1.准备一个可变长度的data
//    NSMutableData *md = [NSMutableData data];
//    //2.创建归档对象
//    NSKeyedArchiver *arch = [[NSKeyedArchiver alloc]initForWritingWithMutableData:md];
//    //3.把对象编码进去
//    [arch encodeObject:names forKey:@"names"];
//    //4.完成编码
//    [arch finishEncoding];
//    NSLog(@"%d",md.length);
//    
//    [md writeToFile:@"/Users/tarena/Desktop/abc" atomically:YES];
//    ************反归档
    NSData *data = [NSData dataWithContentsOfFile:@"/Users/tarena/Desktop/abc"];
    //创建反归档对象
    NSKeyedUnarchiver *unArch = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    //把对象解码出来
    NSArray *newNames = [unArch decodeObjectForKey:@"names"];
    NSLog(@"%@",newNames);
    for (NSString *name in newNames) {
        NSLog(@"%@",name);
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
