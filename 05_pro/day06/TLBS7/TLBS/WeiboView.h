//
//  WeiboView.h
//  Day10WeiboDemo
//
//  Created by apple on 13-11-26.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Weibo.h"
#import "RTLabel.h"
@interface WeiboView : UIView
@property (nonatomic,strong)Weibo *weibo;

@property (nonatomic,strong) WeiboView *repostView;//转发微博视图
@property (nonatomic,strong)RTLabel *weiboLabel;
@property (nonatomic,strong)UIImageView *image;


@end
