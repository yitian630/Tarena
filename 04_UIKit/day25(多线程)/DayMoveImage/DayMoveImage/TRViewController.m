//
//  TRViewController.m
//  DayMoveImage
//
//  Created by tarena on 14-5-6.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSMutableArray *ivs = [NSMutableArray array];
    for (int i=0; i<9; i++) {
        UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(100+i*8, 150, 50, 80)];
        iv.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i]];
        iv.layer.borderWidth = 2;
        [self.view addSubview:iv];
        [ivs addObject:iv];
    }
    
    
    
    //开启子线程开始每个一段时间发一张牌
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        for (int i=0; i<9; i++) {
            [NSThread sleepForTimeInterval:1];
            UIImageView *iv = ivs[8-i];
            dispatch_async(dispatch_get_main_queue(), ^{
                    [UIView animateWithDuration:.7 animations:^{
                        iv.frame = CGRectMake(i%3*(320/3), i/3*(568/3), 320/3, 568/3);
                    }];
            });
            
            
        }
        
        
        
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
