//
//  TRViewController.m
//  Day5Gesture
//
//  Created by tarena on 14-4-15.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
- (IBAction)tapAction:(UITapGestureRecognizer *)sender;

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
    iv.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:iv];
    iv.userInteractionEnabled = YES;
   
   
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageClicked:)];
    [tap setNumberOfTapsRequired:5];
    [tap setNumberOfTouchesRequired:2];
    [iv addGestureRecognizer:tap];
    
    
}
-(void)imageClicked:(UITapGestureRecognizer*)tap{
    NSLog(@"点击小图片了");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapAction:(UITapGestureRecognizer *)sender {
    
    NSLog(@"图片被点击了");
}
@end
