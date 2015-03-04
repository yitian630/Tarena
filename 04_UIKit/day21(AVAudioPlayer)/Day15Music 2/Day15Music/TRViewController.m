//
//  TRViewController.m
//  Day15Music
//
//  Created by tarena on 14-4-29.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UISlider *mySlider;
- (IBAction)valueChangeAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *allTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentTimeLabel;
- (IBAction)clicked:(UIButton *)sender;
@property (nonatomic, strong)AVAudioPlayer *player;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    NSData *data = [NSData dataWithContentsOfFile:@"/Users/tarena/Desktop/musics/胡夏 - 同桌的你(电影《同桌的妳》片尾主题曲).mp3"];
//	self.player = [[AVAudioPlayer alloc]initWithData:data error:Nil];
//    NSURL 表示路径  表示本地(fileURLWithPath) 或者网络路径(urlWithString)
    NSURL *filePath = [NSURL fileURLWithPath:@"/Users/tarena/Desktop/musics/胡夏 - 同桌的你(电影《同桌的妳》片尾主题曲).mp3"];
    self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:filePath error:Nil];
   //准备播放
    [self.player prepareToPlay];
    
    //设置最大值为总时间
    self.mySlider.maximumValue = self.player.duration;
    //显示总时间
    self.allTimeLabel.text = [NSString stringWithFormat:@"%02d:%02d",(int)self.player.duration/60,(int)self.player.duration%60];
    
 
    [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(updateUI) userInfo:Nil repeats:YES];
    
}
-(void)updateUI{
    self.mySlider.value = self.player.currentTime;
    
    //更新播放时间
        self.currentTimeLabel.text = [NSString stringWithFormat:@"%02d:%02d",(int)self.player.currentTime/60,(int)self.player.currentTime%60];
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
                .player.isPlaying) {//如果正在播放 那就暂停
                [self.player pause];
                 [sender setTitle:@"播放" forState:UIControlStateNormal];
            }else{
                //如果暂停 那就播放
                [self.player play];
                
                [sender setTitle:@"暂停" forState:UIControlStateNormal];
            }
            break;
            
        case 1://快退
            self.player.currentTime-=5;
            break;
        case 2://快进
            self.player.currentTime+=5;
            break;
    }
}
- (IBAction)valueChangeAction:(id)sender {
//100
    //当slider里面的值发生改变的时候 把值取出来给到播放器对象
    self.player.currentTime = self.mySlider.value;


}
@end
