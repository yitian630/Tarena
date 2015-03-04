//
//  TRViewController.m
//  Day9DatePIcker
//
//  Created by tarena on 14-4-21.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
- (IBAction)clicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIDatePicker *myDP;

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clicked:(id)sender {
    self.myLabel.text = [NSString stringWithFormat:@"%@",self.myDP.date];
}
- (IBAction)valueChangedAction:(UIDatePicker *)sender {
       self.myLabel.text = [NSString stringWithFormat:@"%@",self.myDP.date];
    
    
}

- (IBAction)showDatePicker:(id)sender {
    
    CGRect frame = self.myDP.frame;
//    frame xy有值   bounds xy为0，0
    if (self.myDP.tag == 0) {//如果没显示
            frame.origin.y = self.view.frame.size.height-self.myDP.frame.size.height;
        self.myDP.tag = 1;//表示DP显示出来了
    }else{//如果显示了  隐藏
        frame.origin.y = self.view.frame.size.height;
        self.myDP.tag = 0;//0表示隐藏了
    }
    //给DP的移动加上动画
    [UIView animateWithDuration:.5 animations:^{
            self.myDP.frame = frame;
    }];

    
    
    
}
@end
