//
//  TRInputViewController.m
//  Demo1_Delegate
//
//  Created by tarena on 14-4-4.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRInputViewController.h"

@interface TRInputViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;

@end

@implementation TRInputViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)back
{
    //向delegate发消息，传参数
    [self.delegate inputViewController:self inputContent:self.inputTextField.text];
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
