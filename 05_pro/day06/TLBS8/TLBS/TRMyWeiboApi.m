//
//  TRMyWeiboApi.m
//  TLBS
//
//  Created by tarena on 14-5-20.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRMyWeiboApi.h"
#import "WeiboApi.h"
#import "constant.h"
static WeiboApi *weiboApi;
@implementation TRMyWeiboApi

+(id)shareWeiboApi{
    if (!weiboApi) {
        weiboApi = [[WeiboApi alloc]initWithAppKey:WiressSDKDemoAppKey andSecret:WiressSDKDemoAppSecret andRedirectUri:REDIRECTURI andAuthModeFlag:0 andCachePolicy:0];
    }
    
    return weiboApi;
}

 
@end
