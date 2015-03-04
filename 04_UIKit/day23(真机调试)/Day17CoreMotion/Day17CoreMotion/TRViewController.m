//
//  TRViewController.m
//  Day17CoreMotion
//
//  Created by tarena on 14-5-4.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import <CoreMotion/CoreMotion.h>
@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UIButton *myBall;
@property (nonatomic ,strong)CMMotionManager *manager;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	 
    self.manager = [[CMMotionManager alloc]init];
    //设置更新频率
    [self.manager setAccelerometerUpdateInterval:1.0/30];
    //开始更新
    [self.manager startAccelerometerUpdates];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0/30 target:self selector:@selector(updateInfo) userInfo:Nil repeats:YES];
    
    
}
-(void)updateInfo{
    //获取重力感应数据
    CMAcceleration acc = self.manager.accelerometerData.acceleration;
    
    NSLog(@"x = %f y = %f z= %f",acc.x,acc.y,acc.z);
    self.myBall.center = CGPointMake(self.myBall.center.x+acc.x, self.myBall.center.y-acc.y);
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
