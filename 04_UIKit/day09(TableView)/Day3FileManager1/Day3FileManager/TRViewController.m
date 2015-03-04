//
//  TRViewController.m
//  Day3FileManager
//
//  Created by tarena on 14-4-11.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *directoryPath = @"/Users/tarena/Desktop/Photos.localized";
    //获得文件夹里面的文件和文件夹
    NSArray *fileNames = [fm contentsOfDirectoryAtPath:directoryPath error:Nil];
   
    for (NSString *fileName in fileNames) {
       
//        [fileName rangeOfString:@"jpg"].length>0 判断是否包含某个字符串
        if ([fileName hasSuffix:@"jpg"]) {
            NSString *imagePath = [directoryPath stringByAppendingPathComponent:fileName];
            NSLog(@"%@",imagePath);
        }
       
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
