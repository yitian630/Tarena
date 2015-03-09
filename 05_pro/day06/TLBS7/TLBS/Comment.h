//
//  Comment.h
//  Day10WeiboDemo
//
//  Created by apple on 13-11-27.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfo.h"
#import "Weibo.h"
@interface Comment : NSObject
@property (nonatomic, copy) NSString *createdDate;
@property (nonatomic, strong) NSNumber *ID;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, strong) UserInfo *user;
@property (nonatomic, copy) NSString *mid;
@property (nonatomic, copy) NSString *idstr;
@property (nonatomic, strong)Weibo  *weibo;

-(float)getCommentHight;
@end

