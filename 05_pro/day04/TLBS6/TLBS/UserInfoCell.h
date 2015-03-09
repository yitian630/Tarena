//
//  UserInfoCell.h
//  TLBS-Project
//
//  Created by 123 on 13-12-23.
//  Copyright (c) 2013年 Wei WenRu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ProfileImageView;
@class UserInfo;

@interface UserInfoCell : UITableViewCell

@property (nonatomic, retain)UIImageView *userImageView;
@property (nonatomic, retain)UILabel *nickNameLabel;
@property (nonatomic, retain)UILabel *nameLabel;
@property (nonatomic, retain)UIButton *topic;
@property (nonatomic, retain) UserInfo *userInfo;

@property (nonatomic, retain) UIViewController* delegate;



@end
