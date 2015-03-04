//
//  TRViewController.m
//  Demo1_Delegate
//
//  Created by tarena on 14-4-1.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

//1. 遵守委托协议
@interface TRViewController () <UIAlertViewDelegate, UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation TRViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)nextInput
{
    [self.passwordTextField becomeFirstResponder];
}
- (IBAction)didInput
{
    if([@"Daniel" isEqualToString:self.userNameTextField.text] && [@"abc123" isEqualToString:self.passwordTextField.text]){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"登录成功" message:@"欢迎进入我们的系统" delegate:self /*3.将自己设置为被委托对象*/cancelButtonTitle:@"取消" otherButtonTitles:@"确定", @"我想想...", nil];
        [alert show];
    }else{
        //失败
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"登录失败" message:@"用户名或密码错误" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}


#pragma mark - UIAlertViewDelegate
//2. 实现委托方法(不一定全部)
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"buttonIndex:%d", buttonIndex);
    if(buttonIndex==0){
        NSLog(@"用户取消了登录");
    }else if(buttonIndex==1){
        NSLog(@"用户已经登录，进入下一个界面");
        //让用户选择进入微信还是微博还是QQ...
        UIActionSheet *action = [[UIActionSheet alloc]initWithTitle:@"请选择进入哪个应用" delegate:self cancelButtonTitle:@"取消选择" destructiveButtonTitle:@"很重要的一个选项" otherButtonTitles:@"进入微信", @"新浪微博", @"腾讯微博", @"腾讯QQ", nil];
        [action showInView:self.view];
    }else if(buttonIndex==2){
        NSLog(@"用户还在犹豫");
    }
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"buttonIndex:%d", buttonIndex);
    if(buttonIndex==0){
        NSLog(@"很重要和危险的事");
    }else if(buttonIndex==1){
        NSLog(@"进入微信");
        
    }else if(buttonIndex==2){
        NSLog(@"进入新浪微博");
        
    }else if(buttonIndex==3){
        NSLog(@"进入腾讯微博");
        
    }else if(buttonIndex==4){
        NSLog(@"进入腾讯QQ");
        
    }else{
        NSLog(@"用户取消了选择");
    }
}


@end
