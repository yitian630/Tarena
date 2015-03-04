//
//  TRViewController.m
//  Day6DrawLineColor
//
//  Created by tarena on 14-4-16.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRDrawView.h"
#import "TRLine.h"
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
        case 3://撤销
        {
            if (self.dv.lines.count>0) {
                //把最后一个取出来
                TRLine *line = [self.dv.lines lastObject];
                [self.dv.deleteLines addObject:line];
                //删除最后一个
                [self.dv.lines removeLastObject];
                [self.dv setNeedsDisplay];

            }
        }
            
            
            break;
        case 4:
        {
            if (self.dv.deleteLines.count>0) {
                TRLine *line = [self.dv.deleteLines lastObject];
                [self.dv.lines addObject:line];
                [self.dv.deleteLines removeLastObject];
                [self.dv setNeedsDisplay];
            }
            
        }
            break;
    }
    
    
    
}
@end
