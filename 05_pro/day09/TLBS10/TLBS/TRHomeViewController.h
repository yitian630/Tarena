//
//  TRHomeViewController.h
//  TLBS
//
//  Created by tarena on 14-3-28.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboApi.h"
#import "UserInfo.h"
@interface TRHomeViewController : UITableViewController<WeiboAuthDelegate>
@property (nonatomic, strong)UserInfo *currentUserInfo;
@end
