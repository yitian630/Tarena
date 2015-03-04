//
//  TRViewController.m
//  Day12UserDefaults
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
    //得到标准的userDefaults对象
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    //首先需要把之前运行的次数取出来
    int runTimes = [ud integerForKey:@"runTimes"];
    NSLog(@"之前运行了%d次",runTimes);
  
    //设置一下要保存的数据 再保存回去
    [ud setInteger:++runTimes forKey:@"runTimes"];
    //切记！最后一定要同步 把内存中的数据同步到文件中
    [ud synchronize];
    
//    NSLog(@"%@",NSHomeDirectory());
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
