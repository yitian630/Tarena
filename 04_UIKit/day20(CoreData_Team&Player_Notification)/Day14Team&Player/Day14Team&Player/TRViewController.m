//
//  TRViewController.m
//  Day14Team&Player
//
//  Created by tarena on 14-4-28.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRAppDelegate.h"
#import "Team.h"
#import "Player.h"
@interface TRViewController ()
- (IBAction)insertAction:(id)sender;
- (IBAction)findAction:(id)sender;

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

- (IBAction)insertAction:(id)sender {
    
    TRAppDelegate *app = [UIApplication sharedApplication].delegate;
    Team *t = [NSEntityDescription insertNewObjectForEntityForName:@"Team" inManagedObjectContext:app.managedObjectContext];
    
    t.name = @"火箭";
    [app saveContext];
    
    Player *p1 = [NSEntityDescription insertNewObjectForEntityForName:@"Player" inManagedObjectContext:app.managedObjectContext];
    
    p1.name = @"魔兽";
    Player *p2 = [NSEntityDescription insertNewObjectForEntityForName:@"Player" inManagedObjectContext:app.managedObjectContext];
    
    p2.name = @"林书豪";
//    以下建立关系的代码二选一
//    [t addPlayersObject:p1];
    p1.myTeam = t;
    p2.myTeam = t;
    [app saveContext];
    
    
}

- (IBAction)findAction:(id)sender {
        TRAppDelegate *app = [UIApplication sharedApplication].delegate;
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Team"];
    
    NSArray *teams = [app.managedObjectContext executeFetchRequest:request error:Nil];
    
    Team *t = teams[0];
    
    for (Player *p in t.players) {
        NSLog(@"球队%@里面的%@",t.name,p.name);
    }
}
@end
