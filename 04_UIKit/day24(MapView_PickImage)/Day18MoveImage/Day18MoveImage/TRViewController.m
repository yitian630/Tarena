//
//  TRViewController.m
//  Day18MoveImage
//
//  Created by tarena on 14-5-5.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *mySV;

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSString *appPath = [[NSBundle mainBundle]resourcePath];
    NSFileManager *fm = [NSFileManager defaultManager];
    
    NSMutableArray *imagePaths = [NSMutableArray array];
    
    NSArray *fileNames = [fm contentsOfDirectoryAtPath:appPath error:Nil];
    
    for (NSString *fileName in fileNames) {
        if ([fileName hasSuffix:@"jpg"]) {
            NSString *imagePath = [appPath stringByAppendingPathComponent:fileName];
            
            [imagePaths addObject:imagePath];
        }
    }
    
    for (int i=0; i<imagePaths.count; i++) {
        UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(i%4*80, i/4*80, 80, 80)];
        iv.image = [UIImage imageWithContentsOfFile:imagePaths[i]];
        [self.mySV addSubview:iv];
    }
    
    
   
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
