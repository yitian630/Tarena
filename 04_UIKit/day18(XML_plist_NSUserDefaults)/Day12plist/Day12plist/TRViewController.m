//
//  TRViewController.m
//  Day12plist
//
//  Created by tarena on 14-4-25.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //把plist加载成数组
//	NSArray *booksArr = [NSArray arrayWithContentsOfFile:@"/Users/tarena/Desktop/Day12plist/Day12plist/my.plist"];
//    
//    for (NSDictionary *bookDic in booksArr) {
//        NSLog(@"name = %@ page=%@",[bookDic objectForKey:@"name"],[bookDic objectForKey:@"page"]);
//        
//    }
//    把数组保存成plist
    NSArray *names = [NSArray arrayWithObjects:@"张三",@"李四",@"王五", nil];
    
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [documentPath stringByAppendingPathComponent:@"a.plist"];
    [names writeToFile:filePath atomically:YES];
    
    NSLog(@"%@",NSHomeDirectory());
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
