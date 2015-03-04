//
//  TRPersonInfoViewController.m
//  Day3TableView4Person
//
//  Created by tarena on 14-4-11.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRPersonInfoViewController.h"
#import "TRPerson.h"
@interface TRPersonInfoViewController ()
- (IBAction)clicked:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTF;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;

@end

@implementation TRPersonInfoViewController



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

- (IBAction)clicked:(id)sender {
    
    TRPerson *p = [[TRPerson alloc ]init];
    p.name = self.nameTF.text;
    p.phoneNumber = self.phoneNumberTF.text;
    [self.persons addObject:p];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
