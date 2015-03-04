//
//  TRAppDelegate.m
//  Day8TMusic
//
//  Created by tarena on 14-4-18.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRAppDelegate.h"

@implementation TRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
   //得到标准的userDefaults对象
   NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
   //首先需要把之前运行的次数取出来
   int runTime = [ud integerForKey:@"runTimes"];
   
   if (runTime == 0) {
      UIViewController *vc = [self.window.rootViewController.storyboard instantiateViewControllerWithIdentifier:@"welcomevc"];
      self.window.rootViewController = vc;
   }else{
      self.window.rootViewController = [self.window.rootViewController.storyboard instantiateViewControllerWithIdentifier:@"MainTabController"];
   }
   //设置一下要保存的数据 再保存回去
   [ud setInteger:++runTime forKey:@"runTimes"];
   //切记！最后一定要同步 把内存中的数据同步到文件中
   [ud synchronize];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
