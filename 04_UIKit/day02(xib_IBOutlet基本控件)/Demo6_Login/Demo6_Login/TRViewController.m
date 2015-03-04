//
//  TRViewController.m
//  Demo6_Login
//
//  Created by tarena on 14-3-31.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)usernameInputEnded:(UITextField *)sender
{
    [self.passwordTextField becomeFirstResponder];
}
- (IBAction)passwordEnded:(UITextField *)sender
{
    if([@"Daniel" isEqualToString:self.usernameTextField.text] && [@"abc123" isEqualToString:self.passwordTextField.text]){
        NSLog(@"登录成功.");
    }else{
        NSLog(@"用户名或密码错误.");
    }
}





@end
