//
//  TRViewController.m
//  Day27Model
//
//  Created by tarena on 14-5-17.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UIView *bigView;
- (IBAction)clicked:(id)sender;

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clicked:(id)sender {
    NSMutableData *data = [NSMutableData data];
    NSKeyedArchiver *arch =[[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
 
    [arch encodeObject:self.bigView.subviews forKey:@"views"];
    [arch finishEncoding];
    
    [data writeToFile:@"/Users/tarena/Desktop/style-3-1" atomically:YES];
    
    
    
    
    
    
    
    
}
@end
