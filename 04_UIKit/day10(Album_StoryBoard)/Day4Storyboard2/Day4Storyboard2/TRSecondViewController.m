//
//  TRSecondViewController.m
//  Day4Storyboard2
//
//  Created by tarena on 14-4-14.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRSecondViewController.h"

@interface TRSecondViewController ()
@property (nonatomic, strong)UITextField *secondTF;
@end

@implementation TRSecondViewController

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
    self.secondTF = [[UITextField alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    //设置文本输入框的边框样式
    [self.secondTF setBorderStyle:UITextBorderStyleRoundedRect];
    self.secondTF.text = self.str;
    [self.view addSubview:self.secondTF];
}

-(void)viewWillDisappear:(BOOL)animated{
    
    self.firstVC.myTF.text = self.secondTF.text;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
