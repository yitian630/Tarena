//
//  TRPersonInfoViewController.m
//  Day13CoreDataPersonList
//
//  Created by tarena on 14-4-26.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRPersonInfoViewController.h"
#import "TRAppDelegate.h"
#import "Person.h"
@interface TRPersonInfoViewController ()
- (IBAction)clicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *myBtn;
@property (weak, nonatomic) IBOutlet UITextField *ageTF;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;

@end

@implementation TRPersonInfoViewController



- (void)viewDidLoad
{
    [super viewDidLoad];

    
    if (self.editPerson) {//如果有值说明是修改
        
        self.nameTF.text = self.editPerson.name;
        self.ageTF.text = [NSString stringWithFormat:@"%@",self.editPerson.age];
        
        
        [self.myBtn setTitle:@"修改" forState:UIControlStateNormal];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clicked:(id)sender {
    
    TRAppDelegate *app = [UIApplication sharedApplication].delegate;
    
    if (self.editPerson) {//如果是编辑 就直接修改
        self.editPerson.name = self.nameTF.text;
        self.editPerson.age = @(self.ageTF.text.intValue);
    }else{
        Person *p = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:app.managedObjectContext];
        
        p.name = self.nameTF.text;
        p.age = [NSNumber numberWithInt:self.ageTF.text.intValue];
    }
    
    
    [app saveContext];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}
@end
