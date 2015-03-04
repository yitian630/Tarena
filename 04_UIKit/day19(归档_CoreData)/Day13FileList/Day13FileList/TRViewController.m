//
//  TRViewController.m
//  Day13FileList
//
//  Created by tarena on 14-4-26.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRFile.h"
@interface TRViewController ()

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *path =@"/Users/tarena/Pictures/美女/小清新";
    NSArray *fileNames = [fm contentsOfDirectoryAtPath:path error:Nil];
    
    NSMutableArray *files = [NSMutableArray array];
    for (NSString *fileName in fileNames) {
        if ([fileName hasPrefix:@"."]) {
            continue;
        }
        NSString *filePath =  [path stringByAppendingPathComponent:fileName];
        TRFile *file = [[TRFile alloc]init];
        file.name = fileName;
        file.path = filePath;
        
        NSFileHandle *fh = [NSFileHandle fileHandleForReadingAtPath:filePath];
        file.length = [fh seekToEndOfFile];
        [files addObject:file];
    }
    
    
    NSMutableData *md = [NSMutableData data];
    NSKeyedArchiver *arch = [[NSKeyedArchiver alloc]initForWritingWithMutableData:md];
    [arch encodeObject:files forKey:@"files"];
    [arch finishEncoding];
    
    [md writeToFile:@"/Users/tarena/Desktop/files" atomically:YES];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
