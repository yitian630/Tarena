//
//  CommentCell.h
//  Day10WeiboDemo
//
//  Created by apple on 13-11-27.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Comment.h"
#import "RTLabel.h"
@interface CommentCell : UITableViewCell
@property (nonatomic, strong)Comment *comment;

@property (nonatomic,strong) UILabel *nickNameLabel;
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UIImageView *userImageView;
@property (nonatomic,strong) RTLabel *contentLabel;
@end
