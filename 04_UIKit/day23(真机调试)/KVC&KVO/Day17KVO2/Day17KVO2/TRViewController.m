//
//  TRViewController.m
//  Day17KVO2
//
//  Created by tarena on 14-5-4.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRMouse.h"
@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    TRMouse *m = [[TRMouse alloc]init];
    
    [m addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:Nil];
    
    
}
//当通过KVO实现监听的时候  当值发生改变时，肯定会调用这个方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    int age = [[change objectForKey:@"new"] intValue];
    self.ageLabel.text = [NSString stringWithFormat:@"%d",age];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
