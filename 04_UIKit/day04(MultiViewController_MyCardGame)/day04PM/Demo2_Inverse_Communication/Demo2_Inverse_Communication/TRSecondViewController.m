//
//  TRSecondViewController.m
//  Demo2_Inverse_Communication
//
//  Created by tarena on 14-4-2.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRSecondViewController.h"

@interface TRSecondViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;

@end

@implementation TRSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)backToFirstVC
{
    self.firstVC.content = self.inputTextField.text;
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
