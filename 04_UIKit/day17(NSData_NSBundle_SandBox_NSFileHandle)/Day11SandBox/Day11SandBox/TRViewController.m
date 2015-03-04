//
//  TRViewController.m
//  Day11SandBox
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
	NSLog(@"沙箱的根目录：%@",NSHomeDirectory());
    NSString *homeDirectoryPath = NSHomeDirectory();
    NSString *documentsPath = [homeDirectoryPath stringByAppendingPathComponent:@"Documents"];
    NSString *str = @"哈哈哈";
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"a.txt"];
    [str writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:Nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
