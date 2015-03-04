//
//  TRViewController.m
//  Demo4_Slider_Stepper_Switch
//
//  Created by tarena on 14-3-31.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (strong, nonatomic) UISwitch *switch1;
@property (strong, nonatomic) UISwitch *switch2;
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
    UISlider *slider = [[UISlider alloc]init];
    slider.minimumValue = 0;
    slider.maximumValue = 1;
    slider.value = 0;
    slider.frame = CGRectMake(20, 150, 280, 30);
    [self.view addSubview:slider];
    
    UIStepper *stepper = [[UIStepper alloc]init];
    stepper.value = 0;
    stepper.minimumValue = -50;
    stepper.maximumValue = 50;
    stepper.stepValue = 5;
    stepper.frame = CGRectMake(100, 190, 100, 30);
    [self.view addSubview:stepper];
    
    self.switch1 = [[UISwitch alloc]init];
    self.switch1.on = NO;
    self.switch1.frame = CGRectMake(40, 230, 100, 40);
    [self.view addSubview:self.switch1];
    
    self.switch2 = [[UISwitch alloc]init];
    self.switch2.on = NO;
    self.switch2.frame = CGRectMake(240, 230, 100, 40);
    [self.view addSubview:self.switch2];
    
    
    //slider
    [slider addTarget:self action:@selector(sliderValueChange:) forControlEvents:UIControlEventValueChanged];
    
    //stepper
    [stepper addTarget:self action:@selector(stepperValueChange:) forControlEvents:UIControlEventValueChanged];
    
    //switch
    [self.switch1 addTarget:self action:@selector(switchValueChange:) forControlEvents:UIControlEventValueChanged];
    
    [self.switch2 addTarget:self action:@selector(switchValueChange:) forControlEvents:UIControlEventValueChanged];
}

- (void)sliderValueChange:(UISlider *)sender
{
    self.myLabel.textColor = [UIColor colorWithRed:0.0 green:0.0 blue:sender.value alpha:1.0];
}

- (void)stepperValueChange:(UIStepper *)sender
{
    self.myLabel.text = [NSString stringWithFormat:@"%.0lf", sender.value];
}

- (void)switchValueChange:(UISwitch *)sender
{
    [self.switch1 setOn:sender.on animated:YES];
    [self.switch2 setOn:sender.on animated:YES];
}

@end
