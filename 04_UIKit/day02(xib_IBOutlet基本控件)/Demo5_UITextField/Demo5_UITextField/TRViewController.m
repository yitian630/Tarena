//
//  TRViewController.m
//  Demo5_UITextField
//
//  Created by tarena on 14-3-31.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

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
- (IBAction)tap
{
    [self display];
}
- (IBAction)inputEnded:(UITextField *)sender
{
    [self display];
}

- (void)display
{
    self.displayLabel.text = self.inputTextField.text;
    self.inputTextField.text = @"";
    [self.inputTextField resignFirstResponder];
}

- (IBAction)backgroundTap
{
    self.inputTextField.text = @"";
    [self.inputTextField resignFirstResponder];
}



@end
