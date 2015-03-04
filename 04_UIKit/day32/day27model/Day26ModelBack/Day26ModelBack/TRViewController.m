//
//  TRViewController.m
//  Day26ModelBack
//
//  Created by tarena on 14-5-17.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UIView *myBig;

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSData *data = [NSData dataWithContentsOfFile:@"/Users/tarena/Desktop/style-3-1"];
    
    NSKeyedUnarchiver *unArch = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    
    NSArray *views = [unArch decodeObjectForKey:@"views"];
    
    for (UIView *v in views) {
        
        UIScrollView *sv = [[UIScrollView alloc]initWithFrame:v.frame];
        sv.backgroundColor = [UIColor redColor];
        [self.myBig addSubview:sv];
    }
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
