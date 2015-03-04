//
//  TRViewController.m
//  Day17KVC
//
//  Created by tarena on 14-5-4.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRPerson.h"
@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    TRPerson *p = [[TRPerson alloc]init];
//    p.name = @"张20";
//    p.age = 20;
//    
//    NSLog(@"%@ %d",p.name,p.age);
    
//    KVC 对象的赋值和取值
    [p setValue:@"张20" forKey:@"name"];
    [p setValue:@20 forKey:@"age"];
    p.father = [[TRPerson alloc]init];
    
    [p setValue:@"老张" forKeyPath:@"father.name"];
    [p setValue:@40 forKeyPath:@"father.age"];
    NSLog(@"%@  %@  fatherName = %@ fatherAge = %@",[p valueForKey:@"name"],[p valueForKey:@"age"],[p valueForKeyPath:@"father.name"],[p valueForKeyPath:@"father.age"]);
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
