//
//  TRViewController.m
//  Day9CustomView
//
//  Created by tarena on 14-4-21.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRWaitingView.h"
@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

//   自定义的控件 如果用了xib就不能通过initWithFrame方式创建 这样的话 就和xib没有关系了
//    TRWaitingView *wv = [TRWaitingView alloc]initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
 
    TRWaitingView *wv = [[[NSBundle mainBundle]loadNibNamed:@"TRWaitingView" owner:self options:nil]lastObject];
    
    [self.view addSubview:wv];
    wv.center = CGPointMake(160, 200);
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
