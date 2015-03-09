//
//  CommentCell.m
//  Day10WeiboDemo
//
//  Created by apple on 13-11-27.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "UIViewExt.h"
#import "CommentCell.h"
#import "UIImageView+WebCache.h"
@implementation CommentCell
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initView];
    }
    return self;
}
-(void)initView {
    //头像，昵称，时间
    self.userImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    self.userImageView.layer.cornerRadius = 5;
    self.userImageView.layer.borderWidth=.5;
    self.userImageView.layer.borderColor = [UIColor grayColor].CGColor;
    self.userImageView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.userImageView];
    self.nickNameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    [self.nickNameLabel setFont:[UIFont systemFontOfSize:14]];
    [self.contentView addSubview:self.nickNameLabel];
    self.timeLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    [self.timeLabel setFont:[UIFont systemFontOfSize:14]];
    [self.timeLabel setTextColor:[UIColor blueColor]];
    [self.contentView addSubview:self.timeLabel];
    
    self.contentLabel = [[RTLabel alloc] initWithFrame:CGRectZero];
    self.contentLabel.font = [UIFont systemFontOfSize:14];


    [self.contentView addSubview:self.contentLabel];//添加到cell的contentView
    
    
}


-(void)layoutSubviews {
    [super layoutSubviews];
    //-----------用户头像视图_userImage--------
    NSString *userImageUrl = self.comment.user.head;
    self.userImageView.frame = CGRectMake(5, 5, 35, 35);
    [self.userImageView setImageWithURL:[NSURL URLWithString:userImageUrl]];
    //昵称_nickLabel
    self.nickNameLabel.frame = CGRectMake(50, 5, 200, 20);
    self.nickNameLabel.text = self.comment.user.nick;
    //时间
    self.timeLabel.text = self.comment.createdDate;
    self.timeLabel.frame = CGRectMake(230, 5,150, 20);
    self.contentLabel.frame = CGRectMake(self.userImageView.right+10, self.nickNameLabel.bottom+5, 240, 21);
    NSString *text = self.comment.text;
    self.contentLabel.text = text;
    self.contentLabel.height = self.contentLabel.optimumSize.height;
}

@end
