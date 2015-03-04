//
//  TRViewController.m
//  Day23Json
//
//  Created by tarena on 14-5-13.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //如果进行get请求 请求参数中包含中文的话 需要进行URL编码
    NSString *path = @"http://mp3.baidu.com/dev/api/?tn=getinfo&ct=0&word=过火&ie=utf-8&format=json";
    NSLog(@"path = %@",path);
    //url编码
   path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"path = %@",path);
	NSURL *url = [NSURL URLWithString:path];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:Nil error:Nil];
    
    NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",str);
//     把Json字符串的Data 转成对象（字典或数组）
    NSArray *musicInfos = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:Nil];
    
    NSLog(@"%@",musicInfos);
    for (NSDictionary *musicInfoDic in musicInfos) {
        
    }
    
    
    
//    把对象转回Json字符串的Data
    
    if ([NSJSONSerialization isValidJSONObject:musicInfos]) {
        NSData *newData = [NSJSONSerialization dataWithJSONObject:musicInfos options:NSJSONWritingPrettyPrinted error:Nil];
        
        NSLog(@"%@",[[NSString alloc]initWithData:newData encoding:NSUTF8StringEncoding]);
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
