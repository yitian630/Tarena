//
//  TRViewController.m
//  Day1CutImage
//
//  Created by tarena on 14-4-9.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRZombA.h"
#import "TRZombB.h"
#import "TRZombC.h"
#import "TRZombD.h"
@interface TRViewController ()
@property (nonatomic)int count;
@end

@implementation TRViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
 
    [NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(addZomb) userInfo:nil repeats:YES];
}

//568 -120
-(void)addZomb{
    
    int random = arc4random()%4;
//   在Switch Case里面如果需要创建新变量需要加大括号
    TRZomb *zomb = nil;
    switch (random) {
        case 0:
    
            zomb = [[TRZombA alloc]init];
            
            break;
        case 1:
             zomb = [[TRZombB alloc]init];
            break;
        case 2:
             zomb = [[TRZombC alloc]init];
            break;
        case 3:
             zomb = [[TRZombD alloc]init];
            break;
    }
    zomb.frame = CGRectMake(568,arc4random()%260, 60, 120);
    [self.view addSubview:zomb];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
