//
//  TRViewController.m
//  Day13ArchiverPerson
//
//  Created by tarena on 14-4-26.
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
    p.name = @"老魏";
    p.age = 18;
    p.phoneNumber = @"13535353355";
    NSMutableData *md = [NSMutableData data];
    NSKeyedArchiver *arch = [[NSKeyedArchiver alloc]initForWritingWithMutableData:md];
    [arch encodeObject:p forKey:@"person"];
    [arch finishEncoding];
    
    NSLog(@"%d",md.length);
    
    
    //反归档
    NSKeyedUnarchiver *unArch = [[NSKeyedUnarchiver alloc]initForReadingWithData:md];
    TRPerson *newP = [unArch decodeObjectForKey:@"person"];
    NSLog(@"%@ %d %@",newP.name,newP.age,newP.phoneNumber);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
