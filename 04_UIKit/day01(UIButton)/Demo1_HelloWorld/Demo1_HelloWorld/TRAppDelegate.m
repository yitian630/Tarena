//
//  TRAppDelegate.m
//  Demo1_HelloWorld
//
//  Created by tarena on 14-3-28.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRAppDelegate.h"

@implementation TRAppDelegate
//应用程序真正的入口
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    //加一个控件
    //1.
    UILabel *label = [[UILabel alloc]init];
    //2.
    label.text = @"Hello World";//内容
    label.textColor = [UIColor redColor];
    //CGRect rect = {20, 50, 200, 100};
    CGRect rect = CGRectMake(20, 50, 200, 100);
    label.frame = rect;//位置和大小
    label.font = [UIFont systemFontOfSize:30];//字体
    label.backgroundColor = [UIColor greenColor];//背景色
    
    //3.
    [self.window addSubview:label];
    //让window显示出来
    [self.window makeKeyAndVisible];
    return YES;
}
@end
