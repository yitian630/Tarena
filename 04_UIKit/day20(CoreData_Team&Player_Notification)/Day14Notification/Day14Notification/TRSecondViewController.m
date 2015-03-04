//
//  TRSecondViewController.m
//  Day14Notification
//
//  Created by tarena on 14-4-28.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRSecondViewController.h"

@interface TRSecondViewController ()

@end

@implementation TRSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notificationAction:) name:@"MyNotification" object:Nil];
}
-(void)notificationAction:(NSNotification*)noti{
    NSLog(@"第二个页面：%@",noti.object);
    
    UILabel *l = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    l.text = noti.object;
    [self.view addSubview:l];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
