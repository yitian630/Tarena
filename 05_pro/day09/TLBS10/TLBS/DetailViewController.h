//
//  DetailViewController.h
//  Day10WeiboDemo
//
//  Created by apple on 13-11-27.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Weibo.h"
#import "WeiboCell.h"
@interface DetailViewController : UITableViewController<UIAlertViewDelegate>
@property (nonatomic,strong)Weibo *weibo;

@end
