//
//  TRViewController.m
//  Day23Http
//
//  Created by tarena on 14-5-13.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UITextView *myTV;

@end

@implementation TRViewController
- (IBAction)clicked:(id)sender {
    
    NSString *path = @"http://www.sina.com.cn";
    NSURL *url = [NSURL URLWithString:path];
    
    //创建请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    //设置请求方式 默认请求方式为GET
//    [request setHTTPMethod:@"POST"];
//    //post把请求参数放进请求体里面
//    [request setHTTPBody:[@"mobileCode=18600654335&userID=" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
    //发出一个同步请求
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:Nil error:Nil];
    //gb2312 gbk中文编码格式
      NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    
    NSString *string = [[NSString alloc]initWithData:data encoding:enc];
    
    self.myTV.text = string;
    
    
    NSURL *imageUrl = [NSURL URLWithString:@"http://p6.sinaimg.cn/1608617333/180/87861333190413"];
    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
    
    UIImageView *iv = [[UIImageView alloc]initWithFrame: CGRectMake(100, 100, 100, 100)];
    iv.image = [UIImage imageWithData:imageData];
    [self.view addSubview:iv];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
