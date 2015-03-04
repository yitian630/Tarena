//
//  TRViewController.m
//  Day6DrawLineColor
//
//  Created by tarena on 14-4-16.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRDrawView.h"
@interface TRViewController ()
@property (nonatomic, strong)TRDrawView *dv;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dv = [[TRDrawView alloc]initWithFrame:self.view.bounds];
    [self.view insertSubview:self.dv atIndex:0];
}
- (IBAction)valueChangeAction:(id)sender {
    UISlider *s = sender;
    
    self.dv.width = s.value;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clicked:(id)sender {
    UIButton *btn = sender;
    switch (btn.tag) {
        case 0:
            self.dv.color = [UIColor redColor];
            break;
            
        case 1:
            self.dv.color = [UIColor yellowColor];
            break;
        case 2:
            self.dv.color = [UIColor blueColor];
            break;
    }
    
    
    
}
@end
