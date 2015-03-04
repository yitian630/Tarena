//
//  TRViewController.m
//  Day20NSOperation
//
//  Created by tarena on 14-5-8.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"子线程开始");
        //此处写子线程代码
        [NSThread sleepForTimeInterval:5];
         NSLog(@"子线程结束");
        
   
    
    }];
    
    NSOperation *op2 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(op2Action) object:Nil];
    
    
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    //设置线程队列最大的并行数量 数量为1的时候就变成了串行
//    [queue setMaxConcurrentOperationCount:1];
       //给线程添加依赖  op2要等op1执行结束才开始 要把依赖放在放进队列之前
      [op2 addDependency:op1];
    
    //当把operation添加到队列当中的同时 开启线程
    [queue addOperation:op2];
    [queue addOperation:op1];
 

}
-(void)op2Action{
    NSLog(@"子线程2开始");
    [NSThread sleepForTimeInterval:5];
    NSLog(@"子线程2结束");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
