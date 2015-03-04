//
//  TRJdbc.h
//  day06-6
//
//  Created by tarena on 14-3-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TRJdbc <NSObject>
//连接数据库的方式
-(void)connection;
//查询数据库的方式
-(void)select;
//关闭数据库的方式
-(void)close;
@end






