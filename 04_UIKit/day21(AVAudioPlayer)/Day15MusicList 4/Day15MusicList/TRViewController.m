//
//  TRViewController.m
//  Day15Music
//
//  Created by tarena on 14-4-29.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRAppDelegate.h"
#import "Utils.h"
@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UISlider *mySlider;
- (IBAction)valueChangeAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *allTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentTimeLabel;
- (IBAction)clicked:(UIButton *)sender;

@property (nonatomic, strong)NSTimer *timer;
@property (nonatomic, weak)TRAppDelegate *app;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.app = [UIApplication sharedApplication].delegate;
  
    [self playMusic];
    
 
   self.timer = [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(updateUI) userInfo:Nil repeats:YES];
    
    
    
 
}

-(void)playMusic{
    
    //如果上一曲或者下一曲到头的时候 循环播放
    if (self.currentIndex==self.musics.count) {
        self.currentIndex = 0;
    }else if (self.currentIndex==-1){
        self.currentIndex = self.musics.count-1;
    }
    
    
    
    NSString *musicPath = self.musics[self.currentIndex];
    //用.分割成数组 取数组中的第一部分
    self.title = [[musicPath lastPathComponent]componentsSeparatedByString:@"."][0];
    
    
    NSURL *filePath = [NSURL fileURLWithPath:musicPath];
    
    //得到当前播放的歌曲路径
    NSString *currentPath = self.app.player.url.path;
    //判断当前播放的和即将播放的是否相等
    if (![musicPath isEqualToString:currentPath]) {
        self.app.player = [[AVAudioPlayer alloc]initWithContentsOfURL:filePath error:Nil];
    }
    self.app.player.delegate = self;
    //准备播放
    [self.app.player play];
    
    //设置最大值为总时间
    self.mySlider.maximumValue = self.app.player.duration;
    //显示总时间
    self.allTimeLabel.text = [NSString stringWithFormat:@"%02d:%02d",(int)self.app.player.duration/60,(int)self.app.player.duration%60];

}
-(void)viewDidDisappear:(BOOL)animated{
    [self.timer invalidate];
}
-(void)updateUI{
    self.mySlider.value = self.app.player.currentTime;
//更新播放时间
        self.currentTimeLabel.text = [NSString stringWithFormat:@"%02d:%02d",(int)self.app.player.currentTime/60,(int)self.app.player.currentTime%60];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clicked:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
            if (self
                .app.player.isPlaying) {//如果正在播放 那就暂停
                [self.app.player pause];
                 [sender setTitle:@"播放" forState:UIControlStateNormal];
            }else{
                //如果暂停 那就播放
                [self.app.player play];
                
                [sender setTitle:@"暂停" forState:UIControlStateNormal];
            }
            break;
            
        case 1://上一曲
            self.currentIndex--;
            [self playMusic];
            
            break;
        case 2://下一曲
            self.currentIndex++;
            [self playMusic];
            break;
    }
}
- (IBAction)valueChangeAction:(id)sender {
//100
    //当slider里面的值发生改变的时候 把值取出来给到播放器对象
    self.app.player.currentTime = self.mySlider.value;


}
- (void)dealloc
{
    NSLog(@"播放页面删除了");
}

//当歌曲播放完成的时候播放下一曲
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    
    self.currentIndex++;
    [self playMusic];
    
}
@end
