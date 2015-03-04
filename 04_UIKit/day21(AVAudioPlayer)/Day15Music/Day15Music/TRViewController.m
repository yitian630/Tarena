//
//  TRViewController.m
//  Day15Music
//
//  Created by tarena on 14-4-29.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (nonatomic, strong)AVAudioPlayer *player;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    NSData *data = [NSData dataWithContentsOfFile:@"/Users/tarena/Downloads/萧敬腾 - 如果没有你.mp3"];
   NSURL *filePath = [NSURL fileURLWithPath:@"/Users/tarena/Downloads/萧敬腾 - 如果没有你.mp3"];
	self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:filePath error:nil];
    //准备播放 会把歌曲准备好
//      [self.player prepareToPlay];
//暂停
//    [self.player pause];
//    停止会从内存中清楚数据 时间不会变
//    [self.player stop];
//实现进度条需要的数据有：1.总的2.当前的
//    设置或者获取当前时间
    self.player.currentTime = 100;

//    歌曲总时间
    NSLog(@"歌曲总时间：%f",self.player.duration);
    //    音量0-1
    self.player.volume = 1;
    //开始播放
    [self.player play];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
