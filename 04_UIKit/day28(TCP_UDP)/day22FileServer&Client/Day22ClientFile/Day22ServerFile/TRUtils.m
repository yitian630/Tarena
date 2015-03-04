//
//  TRUtils.m
//  Day22ServerFile
//
//  Created by tarena on 14-5-12.
//  Copyright (c) 2014年 tarena. All rights reserved.
//

#import "TRUtils.h"
#import "TRFile.h"
@implementation TRUtils
+(NSMutableArray *)getFilesByDirectoryPath:(NSString *)path{
    NSMutableArray *files = [NSMutableArray array];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *fileNames = [fm contentsOfDirectoryAtPath:path error:Nil];
    for (NSString *fileName in fileNames) {
        if (![fileName hasPrefix:@"."]) {
           
            NSString *filePath = [path stringByAppendingPathComponent:fileName];
            TRFile *f = [[TRFile alloc]init];
            f.path = path;
            f.name = fileName;
            NSFileHandle *readFH = [NSFileHandle fileHandleForReadingAtPath:filePath];
            
            
            f.length = [readFH seekToEndOfFile];
            
            
            [files addObject:f];
            
            
        }
        
        
    }
    
    
    
    return files;
    
}



+(NSMutableData *)getAllDataByHeaderString:(NSString *)string{
    NSData *headerData = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableData *data = [NSMutableData dataWithLength:100];
    
    [data replaceBytesInRange:NSMakeRange(0, headerData.length) withBytes:headerData.bytes];
    
    return data;
    
}
@end
