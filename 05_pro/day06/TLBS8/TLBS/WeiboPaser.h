//
//  WeiboJsonPaser.h
//  Day10WeiboDemo
//
//  Created by apple on 13-11-25.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfo.h"
#import "Weibo.h"
#import "Comment.h"
@interface WeiboPaser : NSObject
 
+(UserInfo*)paseUserInfoByDictionary:(NSDictionary*)dic;
+(NSArray *)paseAllUserByJsonDic:(NSDictionary *)dic;
+(NSArray *)paseListsByJsonDic:(NSDictionary *)dic;
+(NSString *)paseListIDByDic:(NSDictionary *)dic;
+(Weibo*)paseWeiboByDictionary:(NSDictionary *)dic;
+ (Comment*)paseCommentsByDictionary:(NSDictionary*)dic;
@end
