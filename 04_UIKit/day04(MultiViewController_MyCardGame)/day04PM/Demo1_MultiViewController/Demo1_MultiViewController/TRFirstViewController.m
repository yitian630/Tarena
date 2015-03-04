//
//  TRFirstViewController.m
//  Demo1_MultiViewController
//
//  Created by tarena on 14-4-2.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRFirstViewController.h"
#import "TRSecondViewController.h"

@interface TRFirstViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;

@end

@implementation TRFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)goSecondVC
{
    //1. 创建目标VC
    TRSecondViewController *secondVC = [[TRSecondViewController alloc]initWithNibName:@"TRSecondViewController" bundle:nil];
    //2.1 设置跳转的动画
    secondVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    //2.2 传参数
    secondVC.content = self.inputTextField.text;//Good
    
    //3. 跳转
    [self presentViewController:secondVC animated:YES completion:^{
        //secondVC.displayLabel.text = self.inputTextField.text;//Not Good
    }];
}


- (void)dealloc
{
    NSLog(@"FirstViewController dealloc");
}

@end
