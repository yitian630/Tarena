//
//  TRMusicListViewController.m
//  Day23Json
//
//  Created by tarena on 14-5-14.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRMusicListViewController.h"
#import "TRPlayViewController.h"
#import "TRJsonParser.h"
#import "TRMusicInfo.h"
#import "TRMusicInfoCell.h"
@interface TRMusicListViewController ()
@property (nonatomic, strong)NSMutableArray *musicInfos;
@end

@implementation TRMusicListViewController



- (void)viewDidLoad
{
    [super viewDidLoad];

    [self searchInfoAction];
}

-(void)searchInfoAction{
    //如果进行get请求 请求参数中包含中文的话 需要进行URL编码
    NSString *path = [NSString stringWithFormat:@"http://mp3.baidu.com/dev/api/?tn=getinfo&ct=0&word=%@&ie=utf-8&format=json",self.searchInfo];
    NSLog(@"path = %@",path);
    //url编码
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"path = %@",path);
	NSURL *url = [NSURL URLWithString:path];
    
   dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       NSData *jsonData = [NSData dataWithContentsOfURL:url];
       
       if (jsonData.length==2) {
           [self searchInfoAction];
           return ;
       }
       NSLog(@"%d",jsonData.length);
       self.musicInfos = [TRJsonParser parseMusicInfosByJsonData:jsonData];
       //得到数据后需要刷新tableview
       [self.tableView reloadData];
   });
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 
    return self.musicInfos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    TRMusicInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    TRMusicInfo *mi = self.musicInfos[indexPath.row];
    
    cell.musicInfo = mi;
    
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TRMusicInfo *mi = self.musicInfos[indexPath.row];
    
    NSString *songID = mi.songID;
    [self performSegueWithIdentifier:@"playvc" sender:songID];
    
    
    
}
 #pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    TRPlayViewController *vc = segue.destinationViewController;
    vc.songID = sender;
}


@end
