//
//  main.m
//  day02-2
//
//  Created by tarena on 14-3-26.
//  Copyright (c) 2014年 tarena. All rights reserved.
//
/*
 NSDate
 */
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //创建默认的时间对象
        NSDate* date = [NSDate date];
        NSLog(@"date:%@",date);
        //得到一个时间 距现在60秒
        NSDate* date2 = [NSDate dateWithTimeIntervalSinceNow:60];
        NSLog(@"date2:%@",date2);
        //明天此时刻 昨天此时刻
        NSDate* date3 = [NSDate dateWithTimeIntervalSinceNow:60*60*24];
        NSLog(@"date3:%@",date3);
        NSDate* date4 = [NSDate dateWithTimeIntervalSinceNow:-60*60*24];
        NSLog(@"date4:%@",date4);
        
        //当前日期 date
        //创建日期模板对象
        NSDateFormatter* dFormat = [[NSDateFormatter alloc]init];
        //设置日期模板 MM月dd日yyyy年
        //hh12制小时HH24制小时mm分ss秒
        dFormat.dateFormat = @"MM-dd-yyyy hh:mm:ss";
        //将一个日期转换成字符串
        NSString* strDate = [dFormat stringFromDate:date];
        NSLog(@"strDate:%@",strDate);
        
        /*通过身份证号 求年龄*/
        /*
        int age = 18;
        int sid = 0001;
        NSLog(@"sid:%d",sid);
         */
        //身份证号
        NSString* strId = @"230119198007010000";
        //从某个位置开始到结尾
        //[strId substringFromIndex:<#(NSUInteger)#>]
        //从开头到某个位置
        //[strId substringToIndex:(NSUInteger)]
        //从中间的某个位置到某个位置
        //[strId substringWithRange:<#(NSRange)#>]
        //截取年月日
        NSRange yearRange = {6,4};
        NSRange monthRange = {10,2};
        NSRange dayRange = {12,2};
        NSString* year = [strId substringWithRange:yearRange];
        NSString* month = [strId substringWithRange:monthRange];
        NSString* day = [strId substringWithRange:dayRange];
        //得到年月日
        NSLog(@"year:%@ month:%@ day:%@",year,month,day);
        //得到当前时间对象
        NSDate* now = [NSDate date];
        NSDateFormatter* df = [[NSDateFormatter alloc]init];
        df.dateFormat = @"yyyy";
        //得到当前年的字符串信息
        NSString* nowString = [df stringFromDate:now];
        //将字符串对象转换成基本数据类型
        int nowYear = [nowString intValue];
        int intYear = [year intValue];
        NSLog(@"age:%d",nowYear-intYear);
    }
    return 0;
}






