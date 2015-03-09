//
//  UserInfoViewController.m
//  TLBS-Project
//
//  Created by 123 on 13-12-20.
//  Copyright (c) 2013年 Wei WenRu. All rights reserved.
//

#import "UserInfoViewController.h"
#import "UserInfo.h"
#import "WeiboPaser.h"
#import "TRMyWeiboApi.h"
#import "TRWeiboManager.h"
#import "TRHomeViewController.h"

@interface UserInfoViewController ()
@property (nonatomic, strong)UserInfo *userInfo;
@end

@implementation UserInfoViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
 
    [self initUI];
    //从网络获取用户信息
    TRWeiboManager *manager = [TRWeiboManager shareManager];
    
    if (self.userName) {
        [manager getUserInfoByName:self.userName complation:^(id obj) {
            self.userInfo = obj;
            //回到主线程更新界面
            dispatch_async(dispatch_get_main_queue(), ^{
                [self updateUI];
            });

        }];
    }else{
        [manager getUserInfo:^(id obj) {
            self.userInfo = obj;
            //回到主线程更新界面
            dispatch_async(dispatch_get_main_queue(), ^{
                [self updateUI];
            });
        }];
    }
 
    
  
}
- (void)initUI{
    self.headBg.layer.cornerRadius = 45;  //圆弧半径
    self.headBg.layer.borderWidth = .5;
    self.headBg.layer.borderColor = [UIColor grayColor].CGColor;
    self.headBg.layer.masksToBounds = YES;
}

//登陆
-(void)viewDidAppear:(BOOL)animated{
    dispatch_async(dispatch_get_main_queue(), ^{
        [[TRMyWeiboApi shareWeiboApi] loginWithDelegate:self andRootController:self];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)jumpTo:(UIButton *)sender {
    switch (sender.tag) {
        case 0: //herTopic
        {
            TRHomeViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"weibolistvc"];
            vc.currentUserInfo = self.userInfo;
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
            
        case 1: //sendMessage
        
            break;

    }
}
-(void)updateUI{
 
  //设置头像
    UIImageView* userImageView = [[UIImageView alloc]initWithFrame:CGRectMake(120, -40, 80, 80)];
    
    userImageView.backgroundColor = [UIColor clearColor];
    userImageView.layer.cornerRadius = 40;  //圆弧半径
    userImageView.layer.borderWidth = .5;
    userImageView.layer.borderColor = [UIColor grayColor].CGColor;
    userImageView.layer.masksToBounds = YES;
    [self.backView addSubview:userImageView];
     dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.userInfo.head]];
        UIImage *image = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            userImageView.image = image;
        });
     });

    
    self.name.text = self.userInfo.name;
    self.nickName.text = self.userInfo.nick;
    self.sex.text = [NSString stringWithFormat:@"%@", self.userInfo.sex?@"男":@"女"];
    self.age.text = self.userInfo.age;
    self.birthday.text = self.userInfo.birthday;
    self.company.text = self.userInfo.company;
    self.introductionTV.text = self.userInfo.introduction;
}
@end
