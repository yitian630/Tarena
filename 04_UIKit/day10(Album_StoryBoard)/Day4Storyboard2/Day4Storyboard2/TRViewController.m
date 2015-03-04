//
//  TRViewController.m
//  Day4Storyboard2
//
//  Created by tarena on 14-4-14.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRSecondViewController.h"
@interface TRViewController ()


@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//通过连线跳转之前会进入此方法
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //取到连线的目的地页面
    TRSecondViewController *vc = segue.destinationViewController;
    vc.firstVC = self;
    vc.str = self.myTF.text;
}

@end
