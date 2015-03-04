//
//  TRViewController.m
//  Day23Json
//
//  Created by tarena on 14-5-13.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRMusicListViewController.h"
@interface TRViewController ()
- (IBAction)clicked:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *myTF;

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    
   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clicked:(id)sender {
    
    [self performSegueWithIdentifier:@"musicListvc" sender:Nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    TRMusicListViewController *vc = segue.destinationViewController;
    vc.searchInfo = self.myTF.text;
    
}
@end
