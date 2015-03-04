//
//  TRViewController.m
//  Day20Sell
//
//  Created by tarena on 14-5-8.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (nonatomic)int totalCount;
@property (nonatomic)int selledCount;
@property (nonatomic, strong)NSLock *myLock;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myLock = [[NSLock alloc]init];
    self.totalCount = 100;
    NSThread *t1 = [[NSThread alloc]initWithTarget:self selector:@selector(beginSell) object:Nil];
    t1.name = @"一号售票员";
    [t1 start];
    
    NSThread *t2 = [[NSThread alloc]initWithTarget:self selector:@selector(beginSell) object:Nil];
    t2.name = @"二号售票员";
    [t2 start];

}

-(void)beginSell{
    while (YES) {
        //添加同步代码块   2  （）中的参数起到上锁的作用
//        @synchronized(self){
        [self.myLock lock];
            NSString *name = [NSThread currentThread].name;
        
        //如果票卖光了 就结束卖票
        if (self.selledCount==100) {
//            [NSThread exit];//退出线程
            break;
        }
            NSLog(@"%@将要卖%d号票",name,self.selledCount+1);
            self.selledCount++;
    //        [NSThread sleepForTimeInterval:.5];
            NSLog(@"%@卖掉了%d号票 剩余%d张",name,self.selledCount,self.totalCount-self.selledCount);
        [self.myLock unlock];
//        }
        
    }
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
