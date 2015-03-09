//
//  WeiboJsonPaser.m
//  Day10WeiboDemo
//
//  Created by apple on 13-11-25.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "WeiboPaser.h"
#import "UserInfo.h"


@implementation WeiboPaser
+(UserInfo *)paseUserInfoByDictionary:(NSDictionary *)dic{
    
   NSDictionary *userInfoDic = [dic objectForKey:@"data"];
    UserInfo *user = [[UserInfo alloc]init];
    //头像图片
    user.head = [[userInfoDic objectForKey:@"head"]stringByAppendingString:@"/100"];
    //用户名称
    user.name = [userInfoDic objectForKey:@"name"];
    //昵称
    user.nick = [userInfoDic objectForKey:@"nick"];
    //用户id
    user.openid = [userInfoDic objectForKey:@"openid"];
    //性别
    user.sex = [userInfoDic objectForKey:@"sex"];
    //地址
    user.location = [userInfoDic objectForKey:@"location"];
    //简介
    user.introduction = [userInfoDic objectForKey:@"introduction"];
    //生日
    NSNumber* day = [userInfoDic objectForKey:@"birth_day"];
    NSNumber* month =[userInfoDic objectForKey:@"birth_month"];
    NSNumber* year = [userInfoDic objectForKey:@"birth_year"];
    user.birthday = [NSString stringWithFormat:@"%@.%@.%@",year,month,day];
    
    
    
    int old = [[[[[NSDate date]description]componentsSeparatedByString:@"-"]objectAtIndex:0]intValue]-[year intValue];
    //年龄
    user.age = [NSString stringWithFormat:@"%@",old<150?[NSNumber numberWithInt:old]:@"未知"];
    
    //公司
    NSDictionary* companyInfo = [userInfoDic objectForKey:@"comp"];
    NSString* string = nil;
    if ([companyInfo respondsToSelector:@selector(objectForKey:)]) {
        string = [companyInfo objectForKey:@"company_name"];
    }
    user.company = string!=nil ? string: @"未知";
    
    return user;

}
@end
