//
//  TRViewController.m
//  Day3AutoLayout
//
//  Created by tarena on 14-5-21.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UIButton *btn1 = [[UIButton alloc]init];
    btn1.backgroundColor = [UIColor blueColor];
    UIButton *btn2 = [[UIButton alloc]init];
    btn2.backgroundColor = [UIColor blueColor];
    UIButton *btn3 = [[UIButton alloc]init];
    btn3.backgroundColor = [UIColor blueColor];
    UIButton *btn4 = [[UIButton alloc]init];
    btn4.backgroundColor = [UIColor blueColor];
    
    //如果需要通过代码添加约束的话 需要添加下面一行代码
    btn1.translatesAutoresizingMaskIntoConstraints = NO;
    btn2.translatesAutoresizingMaskIntoConstraints = NO;
    btn3.translatesAutoresizingMaskIntoConstraints = NO;
    btn4.translatesAutoresizingMaskIntoConstraints = NO;
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:btn1];
    [self.view addSubview:btn2];
    [self.view addSubview:btn3];
    [self.view addSubview:btn4];
    //创建约束的条件
    NSString *format = @"|-10-[btn4(==btn1)]-10-[btn3(==btn1)]-10-[btn2(==btn1)]-10-[btn1]-10-|";
    //创建一个字典 表示约束是给谁的约束
    NSDictionary *views = NSDictionaryOfVariableBindings(btn1,btn2,btn3,btn4);
    //创建约束
    NSArray *constrains = [NSLayoutConstraint constraintsWithVisualFormat:format options:NSLayoutFormatAlignAllTop metrics:Nil views:views];
    //把约束添加给需要添加约束的控件的父视图
    [self.view addConstraints:constrains];
    
//    *****************添加一个y值的约束
    format = @"V:|-100-[btn1]";
    constrains = [NSLayoutConstraint constraintsWithVisualFormat:format options:NSLayoutFormatAlignAllTop metrics:Nil views:views];
    
    [self.view addConstraints:constrains];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
