//
//  TRViewController.m
//  Day9PickerView
//
//  Created by tarena on 14-4-21.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *myPV;

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    for (int i=0; i<5; i++) {
        [self.myPV selectRow:500 inComponent:i animated:YES];
    }
    
    [NSTimer scheduledTimerWithTimeInterval:.3 target:self selector:@selector(movePV) userInfo:nil repeats:YES];
}
-(void)movePV{
    for (int i=0; i<5; i++) {
        [self.myPV selectRow:arc4random()%990+10 inComponent:i animated:YES];
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark PickerViewDelegate
//控制有多少个分区
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 5;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
  
    return 1000;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
//    UILabel *label = (UILabel *)view;
//    if (!label) {
//       label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 20)];
//    }
//    label.text = [NSString stringWithFormat:@"%d-%d",component,row];
//    ***************显示图片
    UIImageView *iv = (UIImageView *)view;
    if (!iv) {
        iv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    }
    NSString *imageName = [NSString stringWithFormat:@"%d.jpg",row%10];
    iv.image = [UIImage imageNamed:imageName];
    
    return iv;
}
@end
