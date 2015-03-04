//
//  TROracle.m
//  day06-6
//
//  Created by tarena on 14-3-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TROracle.h"

@implementation TROracle
-(void)connection{
    NSLog(@"Oracle数据库连接了...");
}
-(void)select{
    NSLog(@"查询Oracle数据库中的数据");
}
-(void)close{
    NSLog(@"关闭Oracle数据库");
}
@end
