//
//  TRViewController.m
//  Day16Slider
//
//  Created by tarena on 14-4-30.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UISlider *mySlider;

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	  
    UIImage *leftImage = [[UIImage imageNamed:@"playing_volumn_slide_foreground.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(3, 3, 3, 3) resizingMode:UIImageResizingModeStretch];
    UIImage *rightImage = [[UIImage imageNamed:@"playing_volumn_slide_bg.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(3, 3, 3, 3) resizingMode:UIImageResizingModeStretch];
    
    UIImage *centerImage = [UIImage imageNamed:@"playing_volumn_slide_sound_icon.png"];
    
    
    
    [self.mySlider setMinimumTrackImage:leftImage forState:UIControlStateNormal];
    
    [self.mySlider setMaximumTrackImage:rightImage forState:UIControlStateNormal];
    
    [self.mySlider setThumbImage:centerImage forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
