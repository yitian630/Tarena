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
    
    NSString *path = @"http://webservice.webxml.com.cn/WebServices/MobileCodeWS.asmx/getMobileCodeInfo?mobileCode=18600654335&userID=";
    NSURL *url = [NSURL URLWithString:path];
    
    //创建请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //发出一个同步请求
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:Nil error:Nil];
    
    NSString *string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    self.myTV.text = string;
    
    
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
