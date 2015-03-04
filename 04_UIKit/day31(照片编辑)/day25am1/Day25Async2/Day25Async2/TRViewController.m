//
//  TRViewController.m
//  Day25Async2
//
//  Created by tarena on 14-5-15.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSURL *url = [NSURL URLWithString:@"http://music.baidu.com/data/music/file?link=http://zhangmenshiting.baidu.com/data2/music/118358164/14385500158400128.mp3?xcode=2cbd537d68805e661a3968003ee13eb731ba6b5fb13a98ae&song_id=14385500"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //创建线程队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    //设置允许最大的同时请求数量
    [queue setMaxConcurrentOperationCount:5];
    //发出http异步请求 没有下载过程
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSLog(@"%d",data.length);
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
