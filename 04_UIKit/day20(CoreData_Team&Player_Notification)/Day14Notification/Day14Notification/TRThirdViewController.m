//
//  TRThirdViewController.m
//  Day14Notification
//
//  Created by tarena on 14-4-28.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRThirdViewController.h"

@interface TRThirdViewController ()
@property (weak, nonatomic) IBOutlet UITextField *myTF;
- (IBAction)clicked:(id)sender;

@end

@implementation TRThirdViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clicked:(id)sender {
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"MyNotification" object:self.myTF.text];
    
}
@end
