//
//  TRWeiboManager.h
//  TLBS
//
//  Created by tarena on 14-5-20.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfo.h"
#define BASE_URL @"http://open.t.qq.com/api/"
typedef void (^MyCallback)(id obj);

@interface TRWeiboManager : NSObject
+(TRWeiboManager *)shareManager;
@property (nonatomic, strong)NSOperationQueue *myQueue;
@property (nonatomic, copy)NSString *normalParams;
@property (nonatomic, copy)NSString *listID;

-(void)getUserInfo:(MyCallback)complation;

-(void)getFriends:(MyCallback)complation;
@end
