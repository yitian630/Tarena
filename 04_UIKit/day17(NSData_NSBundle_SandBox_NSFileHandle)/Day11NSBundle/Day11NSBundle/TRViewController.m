//
//  TRViewController.m
//  Day11NSBundle
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
    NSLog(@"%@",NSHomeDirectory());
	UIImage *image = [UIImage imageNamed:@"imgs/5.jpg"];
    //通过bundle得到根目录下面资源的完整路径
    NSString *path = [[NSBundle mainBundle]pathForResource:@"0" ofType:@"jpg"];
    
    NSLog(@"%@",path);
    
    NSString *mainPath = [[NSBundle mainBundle]resourcePath];
    NSLog(@"*.app的根路径：%@",mainPath);
    NSString *imagePath = [mainPath stringByAppendingPathComponent:@"imgs/5.jpg"];
    
    UIImageView *iv = [[UIImageView  alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    iv.image = [UIImage imageWithContentsOfFile:imagePath];
    [self.view addSubview:iv];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
