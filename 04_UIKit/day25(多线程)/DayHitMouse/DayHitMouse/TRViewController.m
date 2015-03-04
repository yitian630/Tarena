//
//  TRViewController.m
//  DayHitMouse
//
//  Created by tarena on 14-5-6.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRMouse.h"
@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [NSThread detachNewThreadSelector:@selector(addMouse) toTarget:self withObject:Nil];
}
-(void)addMouse{
    
    while (YES) {
        [NSThread sleepForTimeInterval:.5];
        TRMouse *m = [[TRMouse alloc]initWithFrame:CGRectMake(arc4random()%300, arc4random()%548, 20, 20)];
        [self performSelectorOnMainThread:@selector(updateUI:) withObject:m waitUntilDone:NO];
        
    }
}



-(void)updateUI:(TRMouse *)m{
    
      [self.view addSubview:m];
    //刷新子控件Label显示 如果想刷新自身控件显示则调用setNeedsDisplay方法
    [m setNeedsLayout];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
