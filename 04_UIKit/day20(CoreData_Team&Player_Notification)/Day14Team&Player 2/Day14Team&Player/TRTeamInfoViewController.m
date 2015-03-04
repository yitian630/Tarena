//
//  TRTeamInfoViewController.m
//  Day14Team&Player
//
//  Created by tarena on 14-4-28.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRTeamInfoViewController.h"
#import "Team.h"
#import "TRAppDelegate.h"
@interface TRTeamInfoViewController ()
- (IBAction)clicked:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;

@end

@implementation TRTeamInfoViewController

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
	 
    if (self.editTeam) {
        self.nameTF.text = self.editTeam.name;
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clicked:(id)sender {

    TRAppDelegate *app = [UIApplication sharedApplication].delegate;
    
    if (self.editTeam) {
        self.editTeam.name = self.nameTF.text;
    }else{
        Team *t = [NSEntityDescription insertNewObjectForEntityForName:@"Team" inManagedObjectContext:app.managedObjectContext];
        t.name = self.nameTF.text;
    }
    [app saveContext];
    
    [self dismissViewControllerAnimated:YES completion:Nil];


}
@end
