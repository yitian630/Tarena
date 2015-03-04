//
//  TRViewController.m
//  Day19GCD
//
//  Created by tarena on 14-5-6.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
//    //创建一个线程队列
//    dispatch_queue_t  myQueue = dispatch_queue_create("q", NULL);//第二个参数是预留参数没有意义
//    
//    //创建一个新的子线程
//    dispatch_async(myQueue, ^{
//       //此处就是子线程代码
//        NSLog(@"开启1号线程");
//        [NSThread sleepForTimeInterval:2];
//          NSLog(@"1号线程结束");
//    });
//    
//    //创建一个新的子线程
//    dispatch_async(myQueue, ^{
//        //此处就是子线程代码
//        NSLog(@"开启2号线程");
//        [NSThread sleepForTimeInterval:2];
//        NSLog(@"2号线程结束");
//    });
 
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"1号线程开始");
        [NSThread sleepForTimeInterval:2];
          NSLog(@"1号线程结束");
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"2号线程开始");
        [NSThread sleepForTimeInterval:2];
        NSLog(@"2号线程结束");
    });
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
