//
//  TRCViewController.m
//  Demo1_Delegate
//
//  Created by tarena on 14-4-4.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRCViewController.h"
#import "TRInputViewController.h"

@interface TRCViewController () <TRInputViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

@end

@implementation TRCViewController

- (void)inputViewController:(TRInputViewController *)inputVC inputContent:(NSString *)content
{
    self.displayLabel.text = content;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)gotoInputVC
{
    TRInputViewController *inputVC = [[TRInputViewController alloc]initWithNibName:@"TRInputViewController" bundle:nil];
    inputVC.delegate = self;
    [self presentViewController:inputVC animated:YES completion:nil];
}
- (IBAction)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
