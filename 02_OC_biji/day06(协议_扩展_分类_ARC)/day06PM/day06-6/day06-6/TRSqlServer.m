//
//  TRSqlServer.m
//  day06-6
//
//  Created by tarena on 14-3-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRSqlServer.h"

@implementation TRSqlServer
-(void)connection{
    NSLog(@"SqlServer数据库连接了...");
}
-(void)select{
    NSLog(@"查询SqlServer数据库中的数据");
}
-(void)close{
    NSLog(@"关闭SqlServer数据库");
}
@end
