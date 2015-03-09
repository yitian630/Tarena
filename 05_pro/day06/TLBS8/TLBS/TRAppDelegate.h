//
//  TRAppDelegate.h
//  TLBS
//
//  Created by tarena on 14-3-28.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboApi.h"
@interface TRAppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) WeiboApi *weiboApi;
@property (strong, nonatomic) UIWindow *window;

@end
