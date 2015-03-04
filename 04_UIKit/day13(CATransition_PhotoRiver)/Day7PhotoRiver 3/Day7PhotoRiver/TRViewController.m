//
//  TRViewController.m
//  Day7PhotoRiver
//
//  Created by tarena on 14-4-17.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRPhoto.h"
@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSMutableArray *imagePaths = [NSMutableArray array];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *path =@"/Users/tarena/Desktop/美女/美女";
    NSArray *fileNames = [fm contentsOfDirectoryAtPath:path error:Nil];
    for (NSString *fileName in fileNames) {
        if ([fileName hasSuffix:@"jpg"]) {
              NSString *imagePath = [path stringByAppendingPathComponent:fileName];
            [imagePaths addObject:imagePath];
        }
       
    }
    
    //添加9张图片
    
    for ( int i=0; i<9; i++) {
        TRPhoto *p = [[TRPhoto alloc]initWithFrame:CGRectZero andImagePaths:imagePaths];
        [self.view addSubview:p];
    }
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
