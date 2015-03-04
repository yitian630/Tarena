//
//  TRViewController.m
//  Day12HitMouse
//
//  Created by tarena on 14-4-25.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRMouse.h"
@interface TRViewController ()
@property (nonatomic, strong)NSTimer *timer;

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

   self.timer = [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(addMouse) userInfo:Nil repeats:YES];
}
-(void)addMouse{
    TRMouse *m = [[TRMouse alloc]initWithFrame:CGRectMake(arc4random()%300, arc4random()%548, 20, 20)];
    m.delegate = self;
    [self.view addSubview:m];
}
-(void)gameover{
    //让添加老鼠停掉
    [self.timer invalidate];
    //删除当前界面的所有老鼠
    for (UIView *subView in self.view.subviews) {
        if ([subView isMemberOfClass:[TRMouse class]]) {
            [subView removeFromSuperview];
            TRMouse *m = (TRMouse*)subView;
            //老鼠死掉的时候要让老鼠倒计时的timer停止
            [m.timer invalidate];
            
        }
    }
    
    
    //得到当前得分
    int successCount = self.successLabel.text.intValue;
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    int oldCount = [ud integerForKey:@"successCount"];
    NSString *info = Nil;
    if (oldCount<successCount) {
        //如果这次是最高分 把这次的分数保存起来
        [ud setInteger:successCount forKey:@"successCount"];
        [ud synchronize];
        info = [NSString stringWithFormat:@"恭喜您 破纪录了！！%d分",successCount];
    }else{//如果没有破纪录
        info = [NSString stringWithFormat:@"你弱爆了刚打了%d分！！",successCount];
    }
    
    
    UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"提示" message:info delegate:self cancelButtonTitle:@"确定" otherButtonTitles:Nil, nil];
    [av show];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
