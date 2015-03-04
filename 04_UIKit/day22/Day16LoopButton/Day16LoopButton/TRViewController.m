//
//  TRViewController.m
//  Day16LoopButton
//
//  Created by tarena on 14-4-30.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRLoopButton.h"
@interface TRViewController ()
@property (weak, nonatomic) IBOutlet TRLoopButton *myStroyboardBtn;

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //给按钮设置图片
    NSArray *images = @[@"playing_circle_btn.png",@"playing_single_btn.png",@"playing_random_btn.png"];
    NSArray *hImages = @[@"playing_circle_btn_h.png",@"playing_single_btn_h.png",@"playing_random_btn_h.png"];
	TRLoopButton *btn = [[TRLoopButton alloc]initWithFrame:CGRectMake(100, 100, 50, 30)];
    
    [btn setImages:images andHImages:hImages];
   
    [self.view addSubview:btn];
    
    
    [self.myStroyboardBtn setImages:images andHImages:hImages];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
