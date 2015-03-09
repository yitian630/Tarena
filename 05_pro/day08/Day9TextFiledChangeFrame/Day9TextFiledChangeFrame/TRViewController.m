//
//  TRViewController.m
//  Day9TextFiledChangeFrame
//
//  Created by tarena on 14-5-27.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UITextField *myTF;

@end

@implementation TRViewController
- (IBAction)clicked:(id)sender {
    [self.myTF resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(frameChangedAction:) name:UIKeyboardWillChangeFrameNotification object:Nil];
}
-(void)viewDidAppear:(BOOL)animated{
    [self.myTF becomeFirstResponder];
}
-(void)frameChangedAction:(NSNotification*)noti{
    NSDictionary *dic = noti.userInfo;
    CGRect keyboardRect = [[dic objectForKey:@"UIKeyboardFrameEndUserInfoKey"]CGRectValue];
    NSLog(@"y=%f",keyboardRect.origin.y);
   //设置文本输入框的位置
    CGRect frame = self.myTF.frame;
    frame.origin.y = keyboardRect.origin.y-frame.size.height;
    [UIView animateWithDuration:.3 animations:^{
         self.myTF.frame = frame;
    }];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
