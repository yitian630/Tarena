//
//  TRViewController.m
//  Day17KVO
//
//  Created by tarena on 14-5-4.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRPerson.h"
@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    TRPerson *p = [[TRPerson alloc]init];
    p.name = @"小张";
    p.delegate = self;
//    //通过通知来实现M和C层之间的交互
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(ageChangedAction:) name:@"changeAge" object:Nil];
    
    //通过KVO实现M->C
    [p addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:Nil];
}
//当通过KVO实现监听的时候 当值发生改变的时候 肯定会调用到这个方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    NSLog(@"obj=%@ change=%@ context = %@",object,change,context);
    int age = [[change objectForKey:@"new"]intValue];
    self.ageLabel.text = [NSString stringWithFormat:@"%d",age];
}

//用通知来实现
//-(void)ageChangedAction:(NSNotification*)noti{
//    int age = [noti.object intValue];
//    self.ageLabel.text = [NSString stringWithFormat:@"%d",age];
//    
//}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
