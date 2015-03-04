//
//  TRViewController.m
//  Day14Notification
//
//  Created by tarena on 14-4-28.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"abc";
	//添加监听
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationAction:) name:@"MyNotification" object:Nil];
}
-(void)notificationAction:(NSNotification *)noti{
    NSLog(@"%@",noti);
}
-(void)dealloc{
    //当次对象销毁的时候一定要删除监听
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
