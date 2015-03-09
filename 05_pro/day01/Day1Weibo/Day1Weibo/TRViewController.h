//
//  TRViewController.h
//  Day1Weibo
//
//  Created by tarena on 14-5-19.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboApi.h"
@interface TRViewController : UIViewController<WeiboAuthDelegate>
@property (nonatomic, strong)WeiboApi *weiboApi;
@end
