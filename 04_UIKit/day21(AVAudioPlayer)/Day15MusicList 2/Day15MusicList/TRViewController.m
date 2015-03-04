//
//  TRViewController.m
//  Day15Music
//
//  Created by tarena on 14-4-29.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRAppDelegate.h"
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
  
 
    NSURL *filePath = [NSURL fileURLWithPath:self.musicPath];
    self.app.player = [[AVAudioPlayer alloc]initWithContentsOfURL:filePath error:Nil];
   //准备播放
    [self.app.player play];
    
    //设置最大值为总时间
    self.mySlider.maximumValue = self.app.player.duration;
    //显示总时间
    self.allTimeLabel.text = [NSString stringWithFormat:@"%02d:%02d",(int)self.app.player.duration/60,(int)self.app.player.duration%60];
    
 
   self.timer = [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(updateUI) userInfo:Nil repeats:YES];
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
            
        case 1://快退
            self.app.player.currentTime-=5;
            break;
        case 2://快进
            self.app.player.currentTime+=5;
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
@end
