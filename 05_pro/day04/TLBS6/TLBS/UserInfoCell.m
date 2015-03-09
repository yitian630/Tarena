//
//  UserInfoCell.m
//  TLBS-Project
//
//  Created by 123 on 13-12-23.
//  Copyright (c) 2013年 Wei WenRu. All rights reserved.
//

#import "UserInfoCell.h"
#import "UserInfo.h"

#import "UserInfoViewController.h"








@implementation UserInfoCell


//初始化子视图
-(void)awakeFromNib
{
    


    //用户头像
    self.userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 35, 35)];
    
    self.userImageView.backgroundColor = [UIColor clearColor];
    self.userImageView.layer.cornerRadius = 5;  //圆弧半径
    self.userImageView.layer.borderWidth = .5;
    self.userImageView.layer.borderColor = [UIColor grayColor].CGColor;
    self.userImageView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.userImageView];
    
    //昵称
    self.nickNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 5, 190, 20)];
    self.nickNameLabel.backgroundColor = [UIColor clearColor];
    self.nickNameLabel.font = [UIFont systemFontOfSize:14.0];
    [self.contentView addSubview:self.nickNameLabel];
    


    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 25, 190, 15)];
    self.nameLabel.font = [UIFont systemFontOfSize:12.0];
    self.nameLabel.backgroundColor = [UIColor clearColor];
    self.nameLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:self.nameLabel];
    
    //发起对话
    self.topic = [[UIButton alloc]initWithFrame:CGRectMake(245, 10, 69, 28)];
    self.topic.titleLabel.font = [UIFont systemFontOfSize:14.0];
    
    [self.topic setTitle:@"发起会话" forState:UIControlStateNormal];
    [self.topic setTintAdjustmentMode:UIViewTintAdjustmentModeNormal];
    [self.topic setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.topic setBackgroundImage:[UIImage imageNamed:@"chat.png"] forState:UIControlStateNormal];
    [self.topic setBackgroundImage:[UIImage imageNamed:@"chat_hover.png"] forState:UIControlStateHighlighted];
    [self.topic addTarget:self action:@selector(chat:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.topic];
    
  
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickedImage)];
    
    [self.userImageView addGestureRecognizer:tap];
    
    
}
-(void)clickedImage{

}
-(void)chat:(UIButton*)btn
{
   
}

#pragma mark - override setter method
//更新显示的内容
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //-----------用户头像视图_userImage--------
  
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.userInfo.head]];
        UIImage *image = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.userImageView.image = image;
        });
    });

    //昵称_nickLabel
   
    self.nickNameLabel.text = self.userInfo.nick;
    //名字name

    self.nameLabel.text = self.userInfo.name;

    

}


@end
