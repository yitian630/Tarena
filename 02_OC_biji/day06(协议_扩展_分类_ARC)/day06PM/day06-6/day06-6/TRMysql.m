//
//  TRMysql.m
//  day06-6
//
//  Created by tarena on 14-3-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRMysql.h"

@implementation TRMysql
-(void)connection{
    NSLog(@"Mysql数据库连接了...");
}
-(void)select{
    NSLog(@"查询Mysql数据库中的数据");
}
-(void)close{
    NSLog(@"关闭Mysql数据库");
}
@end




