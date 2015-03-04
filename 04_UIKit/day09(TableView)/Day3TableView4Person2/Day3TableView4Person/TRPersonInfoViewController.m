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
@property (weak, nonatomic) IBOutlet UIButton *myBtn;
- (IBAction)clicked:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTF;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;

@end

@implementation TRPersonInfoViewController

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
    //判断如果是编辑
    if (self.editPerson) {
        self.nameTF.text = self.editPerson.name;
        self.phoneNumberTF.text = self.editPerson.phoneNumber;
        [self.myBtn setTitle:@"修改" forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clicked:(id)sender {
    //如果editPerson对象存在 说明是编辑
    if (self.editPerson) {
        self.editPerson.name = self.nameTF.text;
        self.editPerson.phoneNumber = self.phoneNumberTF.text;
        
    }else{
        TRPerson *p = [[TRPerson alloc ]init];
        p.name = self.nameTF.text;
        p.phoneNumber = self.phoneNumberTF.text;
        [self.persons addObject:p];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
