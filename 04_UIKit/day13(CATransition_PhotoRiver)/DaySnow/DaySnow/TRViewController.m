//
//  TRViewController.m
//  DaySnow
//
//  Created by tarena on 14-4-17.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (nonatomic, strong)NSTimer *timer;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.timer = [NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(addSnow) userInfo:Nil repeats:YES];
}
-(void)addSnow{
    int width = arc4random()%11+10;
    
    UIImageView *snowIV = [[UIImageView alloc]initWithFrame:CGRectMake(arc4random()%320 -width, -width, width, width)];
    snowIV.image = [UIImage imageNamed:@"snow 2.png"];
    [self.view addSubview:snowIV];
    float speed = (arc4random()%11+40)/10.0;
    
    [UIView animateWithDuration:speed animations:^{
        
        snowIV.center = CGPointMake(snowIV.center.x + arc4random()%100-50, 550);
        
        [snowIV setTransform:CGAffineTransformRotate(snowIV.transform, arc4random()%360 /180.0*M_PI)];
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:1 animations:^{
            snowIV.alpha = 0;
        } completion:^(BOOL finished) {
            [snowIV removeFromSuperview];
        }];
        
        
    }];
    
    
}
- (IBAction)snowSpeedAction:(UISlider *)sender {
    
    [self.timer invalidate];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1-sender.value target:self selector:@selector(addSnow) userInfo:Nil repeats:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
