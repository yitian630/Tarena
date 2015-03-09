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
     NSDictionary *userInfoDic = dic;
    if (dic.count<10) {
        userInfoDic = [dic objectForKey:@"data"];
    }
  
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
+(NSArray *)paseAllUserByJsonDic:(NSDictionary *)dic{
    NSMutableArray *users = [NSMutableArray array];
    NSArray *usersDic = [dic objectForKey:@"data"];
    if ([usersDic isMemberOfClass:[NSNull class]]) {
        return [NSArray array];
    }
    for (NSDictionary *userDic in usersDic) {
        UserInfo *user = [WeiboPaser paseUserInfoByDictionary:userDic];
        [users addObject:user];
        
    }
    return users;
}

+(NSArray *)paseListsByJsonDic:(NSDictionary *)dic{
  
    NSDictionary *dataDic = [dic objectForKey:@"data"];
    if ([dataDic isMemberOfClass:[NSNull class]]) {
        return [NSArray array];
    }
    NSArray *lists = [dataDic objectForKey:@"info"];
    
    NSLog(@"%@",lists);
    return lists;
    
}

+(NSString *)paseListIDByDic:(NSDictionary *)dic{
   
    NSDictionary *dataDic = [dic objectForKey:@"data"];
    return [dataDic objectForKey:@"listid"];
}



+(Weibo *)paseWeiboByDictionary:(NSDictionary *)dic{
    Weibo *myWeibo = [[Weibo alloc]init];
    NSString *timestamp = [dic objectForKey:@"timestamp"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timestamp intValue]];
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy年MM月dd日HH点mm分"];
    //用[NSDate date]可以获取系统当前时间
    NSString *dateStr = [dateFormatter stringFromDate:date];
    
    myWeibo.createDate = dateStr;
    
    myWeibo.text = [dic objectForKey:@"text"];
    
    myWeibo.source = [dic objectForKey:@"from"];
    myWeibo.latitude = [dic objectForKey:@"latitude"];
    myWeibo.longitude = [dic objectForKey:@"longitude"];
    NSArray *images = [dic objectForKey:@"image"];
    if (![images isMemberOfClass:[NSNull class]]&&images.count>0) {
        myWeibo.thumbnailImage = [[images objectAtIndex:0]stringByAppendingString:@"/160"];
        
    }
    id weiboID  = [dic objectForKey:@"id"];
    myWeibo.weiboId = [NSString stringWithFormat:@"%@",weiboID];
    
    
    //获取用户信息
    UserInfo *user = [[UserInfo alloc]init];
    //头像图片
    user.head = [[dic objectForKey:@"head"]stringByAppendingString:@"/100"];
    //昵称
    user.name = [dic objectForKey:@"name"];
    user.nick = [dic objectForKey:@"nick"];
    
    user.sex = [dic objectForKey:@"sex"];
    user.openid = [dic objectForKey:@"openid"];
    //地址
    user.location = [dic objectForKey:@"location"];
    myWeibo.user = user;
    
    
    
    NSDictionary *reWeiboDic = [dic objectForKey:@"source"];
    //判断是否有转发
    if (reWeiboDic && ![reWeiboDic isMemberOfClass:[NSNull class]]) {
        //如果发现有转发 调用自身
        myWeibo.relWeibo = [WeiboPaser paseWeiboByDictionary:reWeiboDic];
        myWeibo.relWeibo.isRepost = YES;
    }
    return myWeibo;
}

+ (Comment*)paseCommentsByDictionary:(NSDictionary*)dic {
    Comment *comment = [[Comment alloc]init];
    NSString *timestamp = [dic objectForKey:@"timestamp"];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timestamp intValue]];
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"MM.dd HH:mm"];
    //用[NSDate date]可以获取系统当前时间
    NSString *dateStr = [dateFormatter stringFromDate:date];
    comment.createdDate = dateStr;
    comment.text = [dic objectForKey:@"text"];
    comment.source = [dic objectForKey:@"from"];
    //获取用户信息
    UserInfo *user = [[UserInfo alloc]init];
    //头像图片
    user.head = [[dic objectForKey:@"head"] stringByAppendingString:@"/100"];
    //昵称
    user.nick = [dic objectForKey:@"nick"];
    
    user.sex = [dic objectForKey:@"sex"];
    user.openid = [dic objectForKey:@"openid"];
    //地址
    user.location = [dic objectForKey:@"location"];
    
    comment.user = user;
    return comment;
}

@end
