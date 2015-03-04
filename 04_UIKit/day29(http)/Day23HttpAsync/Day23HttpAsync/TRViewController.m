//
//  TRViewController.m
//  Day23HttpAsync
//
//  Created by tarena on 14-5-13.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
- (IBAction)clicked:(id)sender;
@property (nonatomic, strong)NSMutableData *data;
@end

@implementation TRViewController

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

- (IBAction)clicked:(id)sender {
    
    NSURL *url = [NSURL URLWithString:@"http://music.baidu.com/data/music/file?link=http://zhangmenshiting.baidu.com/data2/music/119358766/11794803954000128.mp3?xcode=59104db8a87d48588b1d5f3227a7452a2c0420de8b6192ff&song_id=117948039"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //创建对象的同时 后台会开启一个新的线程去发出请求了
    NSURLConnection *conn = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    
}
//接收到服务器的响应
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSHTTPURLResponse *res =(NSHTTPURLResponse*) response;
    //得到响应消息头里面的数据
    NSDictionary *dic = res.allHeaderFields;
    NSLog(@"%@",[dic objectForKey:@"Content-Length"]);
    self.data = [NSMutableData data];
    
}
//接收到数据
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.data appendData:data];
    NSLog(@"%d",data.length);
}
//加载完成
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    [self.data writeToFile:@"/Users/tarena/Desktop/aaaaa.mp3" atomically:YES];
}
//加载失败
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
}

@end
