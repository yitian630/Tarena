//
//  UserInfoViewController.h
//  TLBS-Project
//
//  Created by 123 on 13-12-20.
//  Copyright (c) 2013年 Wei WenRu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRAppDelegate.h"

@interface UserInfoViewController : UIViewController<WeiboRequestDelegate>

@property(retain, nonatomic)NSString* userName;
@property (nonatomic, weak)TRAppDelegate *app;
 

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *nickName;

@property (weak, nonatomic) IBOutlet UILabel *sex;
@property (weak, nonatomic) IBOutlet UILabel *age;
@property (weak, nonatomic) IBOutlet UILabel *birthday;
@property (weak, nonatomic) IBOutlet UILabel *company;

@property (weak, nonatomic) IBOutlet UITextView *introductionTV;


@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIImageView *headBg;
@property (weak, nonatomic) IBOutlet UIButton *herTopicBtn;
@property (weak, nonatomic) IBOutlet UIButton *sendMessageBtn;

- (IBAction)jumpTo:(UIButton *)sender;

@end
