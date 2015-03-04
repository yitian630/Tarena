//
//  TRViewController.m
//  Day19Thread
//
//  Created by tarena on 14-5-6.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
- (IBAction)clicked:(id)sender;

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}
-(void)viewDidAppear:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clicked:(id)sender {
    //开启子线程 withObject传参
     [NSThread detachNewThreadSelector:@selector(newThreadAcion) toTarget:self withObject:Nil];
  
    NSLog(@"主线程代码");
   
    
    
}

-(void)newThreadAcion{
    NSLog(@"新线程开始执行");
    for (int i=0; i<5; i++) {
        UIView *v = [[UIView alloc]initWithFrame:CGRectMake(100, 60*i, 50, 40)];
        v.backgroundColor = [UIColor redColor];
       //把更新界面的代码放到主线程
        [self performSelectorOnMainThread:@selector(updateUI:) withObject:v waitUntilDone:NO];
        [NSThread sleepForTimeInterval:2];
    }
  
    NSLog(@"haha");
    NSLog(@"新线程执行完毕！！");
}

-(void)updateUI:(UIView *)v{
     [self.view addSubview:v];
}
@end
