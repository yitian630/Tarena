//
//  TRViewController.m
//  Day1Weibo
//
//  Created by tarena on 14-5-19.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "constant.h"
@interface TRViewController ()
- (IBAction)clicked:(UIButton *)sender;

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.weiboApi = [[WeiboApi alloc]initWithAppKey:WiressSDKDemoAppKey andSecret:WiressSDKDemoAppSecret andRedirectUri:REDIRECTURI andAuthModeFlag:0 andCachePolicy:0] ;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clicked:(UIButton *)sender {
    switch (sender.tag) {
        case 0:
            [self.weiboApi loginWithDelegate:self andRootController:self];
            break;
            
        case 1:
            [self.weiboApi cancelAuth];
            
            break;
        case 2:
            
            
            break;
    }
}
- (void)DidAuthFinished:(WeiboApiObject *)wbobj{
    NSLog(@"登陆成功！！！");
}

@end
