//
//  TRMyWeiboApi.m
//  TLBS
//
//  Created by tarena on 14-5-20.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRMyWeiboApi.h"

#import "constant.h"
//创建单例对象 设置静态类对象
static WeiboApi *weiboApi;
@implementation TRMyWeiboApi
//实例化单例对象
+(id)shareWeiboApi{
    if (!weiboApi) {
        weiboApi = [[WeiboApi alloc]initWithAppKey:WiressSDKDemoAppKey andSecret:WiressSDKDemoAppSecret andRedirectUri:REDIRECTURI andAuthModeFlag:0 andCachePolicy:0];
    }
    
    return weiboApi;
}

 
@end
