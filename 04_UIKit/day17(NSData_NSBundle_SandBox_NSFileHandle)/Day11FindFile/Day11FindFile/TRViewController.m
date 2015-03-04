//
//  TRViewController.m
//  Day11FindFile
//
//  Created by tarena on 14-4-24.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"

@interface TRViewController ()
@property (nonatomic)int fileCount;
@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self findJpgInPath:@"/Users/"];
}




-(void)findJpgInPath:(NSString *)path{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *fileNames = [fm contentsOfDirectoryAtPath:path error:Nil];
    for (NSString *fileName in fileNames) {
        NSString *filePath = [path stringByAppendingPathComponent:fileName];
        
        BOOL isDir;
        if ([fm fileExistsAtPath:filePath isDirectory:&isDir]&&isDir) {//如果是文件夹
            [self findJpgInPath:filePath];
        }else{//说明是文件
            if ([filePath hasSuffix:@".jpg"]) {
                self.fileCount++;
                NSLog(@"%@============%d",filePath,self
                      .fileCount);
                
//                [fm removeItemAtPath:filePath error:Nil];
            }
            
            
        }
        
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
