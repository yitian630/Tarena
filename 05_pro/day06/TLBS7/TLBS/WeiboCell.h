//
//  WeiboCell.h
//  Day10WeiboDemo
//
//  Created by apple on 13-11-26.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Weibo.h"
#import "WeiboView.h"
@interface WeiboCell : UITableViewCell
@property (nonatomic, weak)UIViewController *delegate;
@property (nonatomic, strong)WeiboView *weiboView;
@property (nonatomic,strong)Weibo *weibo;
@property(nonatomic,strong) UIImageView *userImage; //用户头像
@property(nonatomic,strong) UILabel *nickLabel; //昵称
@property (nonatomic,strong) UILabel *source;//发布来源
@property (nonatomic,strong) UILabel *create;//发布时间
@property(nonatomic,strong)UIButton*chat;//聊天
@end
