//
//  TRViewController.m
//  Day17Movie
//
//  Created by tarena on 14-5-4.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *myIV;

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *fileUrl = [NSURL fileURLWithPath:@"/Users/tarena/Desktop/music/Chasing The Sun -冰河世纪4-主题曲--音悦Tai.mp4"];
    self.player = [[MPMoviePlayerController alloc]initWithContentURL:fileUrl];
    //设置一下播放视频的位置和尺寸
    self.player.view.frame = CGRectMake(0, 0, 200, 200);
    //设置播放控制的样式
    [self.player setControlStyle:MPMovieControlStyleFullscreen];
    //把播放视频的控件添加到界面
    [self.view addSubview:self.player.view];
    [self.player play];
    
 
    //添加监听
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getImageAction:) name:MPMoviePlayerThumbnailImageRequestDidFinishNotification object:Nil];
    
    //不停的获取图片
//    [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(clicked:) userInfo:Nil repeats:YES];
}
//当获取图片的监听响应的时候调用
-(void)getImageAction:(NSNotification*)noti{
    NSDictionary *info = noti.userInfo;
    UIImage *image = [info objectForKey:@"MPMoviePlayerThumbnailImageKey"];
    self.myIV.image = image;
    
    NSLog(@"%@",noti);
    
}
- (IBAction)clicked:(id)sender {
    //过时的方法
    //获取某个时间的截屏  Exact实时的图片另外一个参数 不是获取当前的图片
//    UIImage *image = [self.player thumbnailImageAtTime:self.player.currentPlaybackTime timeOption:MPMovieTimeOptionExact];
//    self.myIV.image = image;
//********************************
    
    //请求当前视频播放的图片 新方法
    [self.player requestThumbnailImagesAtTimes:@[@(self.player.currentPlaybackTime)] timeOption:MPMovieTimeOptionExact];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
