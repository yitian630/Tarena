//
//  TRPlayViewController.m
//  Day23Json
//
//  Created by tarena on 14-5-14.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRPlayViewController.h"
#import "TRJsonParser.h"
#import "TRUtils.h"
@interface TRPlayViewController ()
@property (nonatomic, strong)AVAudioPlayer *player;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSMutableData *musicData;
@property (nonatomic, strong)NSMutableDictionary *lrcDic;
@end

@implementation TRPlayViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	 
    NSString *musicInfoPath = [NSString stringWithFormat:@"http://ting.baidu.com/data/music/links?songIds=%@",self.songID];
    NSURL *url = [NSURL URLWithString:musicInfoPath];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:url];
    
    NSArray *musicPathAndLrcPath = [TRJsonParser paseMusicPathByJsonData:jsonData];
    //开始播放歌曲
    [self playMusicByPath:musicPathAndLrcPath[0]];
    
    //获取歌词
 
    NSURL *lrcUrl = [NSURL URLWithString:musicPathAndLrcPath[1]];
    
    NSString *lrcText = [NSString stringWithContentsOfURL:lrcUrl encoding:NSUTF8StringEncoding error:Nil];
    
    self.lrcDic = [TRUtils parseLrcByString:lrcText];
    
    NSLog(@"%@",lrcText);
    
    
}
-(void)playMusicByPath:(NSString *)path{
        NSLog(@"歌曲下载路径%@",path);
    //url编码
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:path];
    
    NSMutableURLRequest *request= [NSMutableURLRequest requestWithURL:url];
    
    NSURLConnection *conn = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    
    if (!conn) {
        NSLog(@"连接创建失败");
    }
    
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"接收到服务器响应");
    self.musicData = [NSMutableData data];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    NSLog(@"%d",data.length);
    [self.musicData appendData:data];
    
    if (self.musicData.length>100*1024&&!self.player) {
        self.player = [[AVAudioPlayer alloc]initWithData:self.musicData error:Nil];
        [self.player play];
    }
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark tableviewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.lrcDic.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSArray *allKeys = self.lrcDic.allKeys;
    allKeys = [allKeys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        if ([obj1 floatValue]<[obj2 floatValue]) {
            return NSOrderedAscending;
        }else return NSOrderedDescending;
    }];
    NSNumber *key = allKeys[indexPath.row];
    
    cell.textLabel.text = [self.lrcDic objectForKey:key];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.highlightedTextColor = [UIColor redColor];
    [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
    cell.textLabel.textColor = [UIColor greenColor];
    cell.backgroundColor = [UIColor blackColor];
    //创建一个填充cell的View
    cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.bounds];
    
    
    cell.selectedBackgroundView.backgroundColor = [UIColor clearColor];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 20;
}
@end
