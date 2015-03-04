//
//  TRViewController.m
//  Demo3_Argument
//
//  Created by tarena on 14-3-31.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UISwitch *switch1;
@property (weak, nonatomic) IBOutlet UISwitch *switch2;

@end

@implementation TRViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tap:(UIButton *)sender
{
    NSLog(@"...%@, ", sender);
    NSString *title = [sender titleForState:UIControlStateNormal];
    //int number = [title intValue];
    NSLog(@"title:%@", title);
}
- (IBAction)sliderValueChange:(UISlider *)sender
{
    //获取slider对象的value
    NSLog(@"slider value:%f",sender.value);
    self.myLabel.textColor = [UIColor colorWithRed:sender.value green:0 blue:0 alpha:1.0];
}
- (IBAction)stepperValueChange:(UIStepper *)sender
{
    NSLog(@"stepper value: %lf", sender.value);
    self.myLabel.text = [NSString stringWithFormat:@"%.0lf", sender.value];
}
- (IBAction)switchValueChange:(UISwitch *)sender
{
    if(sender.on){
        NSLog(@"开关被打开");
    }else{
        NSLog(@"开关被关闭");
    }
    //self.switch1.on = sender.on;
    //self.switch2.on = sender.on;
    [self.switch1 setOn:sender.on animated:YES];
    [self.switch2 setOn:sender.on animated:YES];
}





@end
